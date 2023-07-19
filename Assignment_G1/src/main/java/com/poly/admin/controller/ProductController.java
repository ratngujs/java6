package com.poly.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.custominterface.CategoryDAO;
import com.poly.custominterface.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;


@Controller
@MultipartConfig
public class ProductController {
	@Autowired
	ProductDAO repoPro;
	@Autowired
	CategoryDAO repoCat;

	@Autowired
	ServletContext context;

	@Autowired
	HttpServletRequest req;

	@GetMapping("/admin/product")
	public String index(@RequestParam("page") Optional<Integer> numpage, Model m) {
		int p = numpage.orElse(0) < 0 ? 0 : numpage.orElse(0);
		Pageable page = PageRequest.of(p, 5);
		m.addAttribute("pageProduct", repoPro.findAll(page));
		return "admin/product/index";
	}
	
	@GetMapping("/admin/product/add")
	public String getViewAddProduct(Model m) {
		Product p = new Product();
		m.addAttribute("product", p);
		return "admin/product/form";
	}

	@GetMapping("/admin/product/edit/{id}")
	public String getViewEditProduct(Model m, @PathVariable("id") Integer id) {
		Product p = repoPro.getById(id);
		if (p != null) {
			m.addAttribute("product", p);
		} else
			return "redirect:/admin/product";
		return "admin/product/form";
	}

	@GetMapping("/admin/product/delete/{id}")
	public String deleteProduct(Model m, @PathVariable("id") Integer id) {
		Product pCheck = repoPro.getById(id);
		if (pCheck != null) {
			try {
				repoPro.delete(pCheck);
			}catch(Exception ex) {
				
			}
		}
			
		return "redirect:/admin/product/";
	}

	@PostMapping("/admin/product/add")
	public String addProduct(Model m, @ModelAttribute("product") Product p,
			@RequestParam("hinhsp") MultipartFile hinhsp) {
		if (hinhsp.isEmpty()) {
			p.setImage("default-product-image.png");
		} else {
			File uploadPath = new File(context.getRealPath("/upload/hinhsp"));
			if (!uploadPath.exists())
				uploadPath.mkdirs();
			File uploadFile = new File(context.getRealPath("/upload/hinhsp/" + hinhsp.getOriginalFilename()));
			try {
				hinhsp.transferTo(uploadFile.toPath());
				p.setImage(hinhsp.getOriginalFilename());
			} catch (IllegalStateException | IOException e) {
				p.setImage("default-product-image.png");
				e.printStackTrace();
			}
		}
		Product tmp = repoPro.saveAndFlush(p);
		if (tmp == null) {
			m.addAttribute("status", false);
			m.addAttribute("message", "Thêm sản phẩm thất bại");
		} else {
			p = new Product();
			m.addAttribute("status", true);
			m.addAttribute("message", "Thêm sản phẩm thành công");
		}
		m.addAttribute("product", p);
		return "admin/product/form";
	}

	@PostMapping("/admin/product/update")
	public String editProduct(Model m, @ModelAttribute("product") Product p,
			@RequestParam("hinhsp") MultipartFile hinhsp) {
		Product pCheck = repoPro.getById(p.getId());
		if (pCheck != null) {
			if (!hinhsp.isEmpty()) {
				File uploadPath = new File(context.getRealPath("/upload/hinhsp"));
				if (!uploadPath.exists())
					uploadPath.mkdirs();
				File uploadFile = new File(context.getRealPath("/upload/hinhsp/" + hinhsp.getOriginalFilename()));
				try {
					hinhsp.transferTo(uploadFile.toPath());
					p.setImage(hinhsp.getOriginalFilename());
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			Product tmp = repoPro.saveAndFlush(p);
			if (tmp == null) {
				m.addAttribute("status", false);
				m.addAttribute("message", "Cập nhật sản phẩm thất bại");
			} else {
				//p = new Product();
				m.addAttribute("status", true);
				m.addAttribute("message", "Cập nhật sản phẩm thành công");
			}
			m.addAttribute("product", p);
		} else
			return "redirect:/admin/product/";
		return "redirect:/admin/product/edit/"+p.getId();
	}


	@ResponseBody
	@PostMapping("/admin/product/list")
	public Map<String, Object> listProduct(@RequestParam("start") Optional<Integer> start,
			@RequestParam("draw") Optional<Integer> draw, Model m) {

		Map<String, Object> data = new HashMap<>();
		int startNum = start.orElse(0);
		int p = startNum / 5;
		Pageable page = PageRequest.of(p, 5);
		Page<Product> pageProduct = repoPro.findAll(page);
		data.put("data", pageProduct.getContent());
		data.put("draw", draw.orElse(0) + 1);
		data.put("recordsTotal", pageProduct.getTotalElements());
		data.put("recordsFiltered", pageProduct.getTotalElements());
		return data;
	}

	@ModelAttribute("tinhtrang")
	public Map<Boolean, String> getTinhTrang() {
		Map<Boolean, String> tmp = new HashMap<>();
		tmp.put(true, "Còn hàng");
		tmp.put(false, "Hết hàng");
		return tmp;
	}

	@ModelAttribute("loaisp")
	public Map<String, String> getLoaiSP() {
		Map<String, String> loaisp = new HashMap<>();
		List<Category> list = repoCat.findAll();
		for (var l : list) {
			loaisp.put(l.getId(), l.getName());
		}
		return loaisp;
	}
	@GetMapping("/product/product-view")
	@ModelAttribute("newProduct")
	public List<Product> getNewProduct(){
		Page<Product> page = repoPro.findAll(PageRequest.of(0, 4, Sort.by(Direction.DESC, "id")));
		return page.getContent();
	} 

}
