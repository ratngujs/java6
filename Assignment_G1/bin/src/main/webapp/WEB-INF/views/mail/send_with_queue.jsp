<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
        <!DOCTYPE html>
        <html> 

        <head>
            <meta charset="utf-8">
            <title>Gửi Mail</title>
            <link rel="stylesheet" href="https://use.fontawesome.com/4ecc3dbb0b.css" media="all">
            <link rel="stylesheet" href="/css/form.css">
            <style>
                textarea {
                    resize: vertical;
                    height: 100px !important;
                }
            </style>
        </head>

        <body>
            <div class="form_wrapper">
                <div class="form_container">
                    <h2>Gửi Mail</h2>
                </div>
                <div class="row clearfix">
                    <div class="">
                        <fr:form method="POST" enctype="multipart/form-data"
                         modelAttribute="mailModel" action="">
                            <div class="input_field">
                                <span><i aria-hidden="true" class="fa fa-users"></i></span>
                                <fr:input path="to" placeholder="Người nhận" />
                            </div>
                            <div class="input_field">
                                <span><i aria-hidden="true" class="fa fa-lock"></i></span>
                                <fr:input path="subject" placeholder="Chủ đề" />
                            </div>
                            <div class="input_field">
                                <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
                                <fr:textarea path="body" />
                            </div>
                            <input type="file" name="attachment" multiple="multiple">
                            <fr:button name="btnGui">Gửi</fr:button>
                        </fr:form>
                    </div>
                </div>
            </div>
        </body>

        </html>