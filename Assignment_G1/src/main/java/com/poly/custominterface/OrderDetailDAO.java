package com.poly.custominterface;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail,Long>  {
	@Query("SELECT o.product.id, o.product.name, COUNT(o.id) AS soLuong FROM OrderDetail o GROUP BY o.product.id, o.product.name")
	List<Object[]> getTop10SPBanChay(Pageable page);
	
	@Query("SELECT o.product.id, o.product.name, COUNT(o.id) AS soLuong FROM OrderDetail o WHERE o.order.createDate BETWEEN :sd AND :ed GROUP BY o.product.id, o.product.name")
	List<Object[]> getTop10SPTheoThoiGian(@Param("sd") Date sd, @Param("ed")  Date ed, Pageable page);
}
