<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload2.jakarta.*"%>
<%@page import="org.apache.commons.fileupload2.core.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<!DOCTYPE html>
<%
		// 파일 업로드 경로
		String uploadPath = "C:/KGW/GITHUB/SHOP_TEST/Shop_Test/src/main/webapp/static/img";
		File uploadDir = new File(uploadPath); // 해당 경로에 대한 File 객체 생성
		String path = "/static/img/";
		
		
		// 해당 경로가 존재하지 않으면 폴더 생성
		if( !uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 클라이언트 요청의 문자 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 임시 파일 저장 경로 설정
		File repository = new File( System.getProperty("java.io.tmpdir") );
		
		// FileItemFactory 설정 : 업로드된 항목을 생성하는 팩토리 객체
		FileItemFactory<DiskFileItem> factory = DiskFileItemFactory
					.builder().setFile(repository).get();
		
		// Servlet 기반 파일 업로드 객체 생성
		JakartaServletFileUpload<DiskFileItem, FileItemFactory<DiskFileItem>>
		upload = new JakartaServletFileUpload<>(factory);
		
		// request 를 변환하기 위한 Context 객체 생성
		JakartaServletRequestContext context = new JakartaServletRequestContext(request);
		
//	 	List<DiskFileItem> items = upload.parseRequest(context);
//	 	Iterator<DiskFileItem> params = items.iterator();
		Product product = null;
	 	String file = "";
	 	String productId = "";
	 	String name = "";
	 	int unitPrice = 0;
	 	String description = "";
	 	String manufacturer = "";
	 	String category = "";
	 	int unitsInStock = 0;
	 	String condition = "";
	 	String fileName = "";
	 	String uploadedName = "";
		try {
			// 요청에서 form field 및 파일을 변환하여 리스트로 가져옴
			List<DiskFileItem> items = upload.parseRequest(context);
			
			for( DiskFileItem item : items ) {
				// 텍스트 필드인 경우
				if (item.isFormField() ) {
					String name2 = item.getFieldName();
					String value = item.getString(StandardCharsets.UTF_8);
// 					out.println(name2 + " : " + value + "<br>");
					System.out.println(file);
					
					switch (name2) {
						case "productId": productId = value; break;
						case "name": name = value; break;
						case "unitPrice": unitPrice = Integer.parseInt(value); break;
						case "description": description = value; break;
						case "manufacturer": manufacturer = value; break;
						case "category": category = value; break;
						case "unitsInStock": unitsInStock = Integer.parseInt(value); break;
						case "condition": condition = value; break;
						case "file": file = value; System.out.println("123" + value); break;
					}
					
				}
				// 파일 필드인 경우
				else {
					String fieldName = item.getFieldName(); // 필드 이름
					fileName = item.getName();		// 파일 이름
					// 업로드 파일 이름
					uploadedName = System.currentTimeMillis() + "_" + fileName;
					
					// 파일명이 비어있지 않으면
					if( fileName != null && !fileName.isEmpty() ) {
						// 저장할 파일 객체 생성
						File uploadedFile = new File(uploadDir, uploadedName);
						try (
							InputStream is = item.getInputStream();
							FileOutputStream fos = new FileOutputStream(uploadedFile);
						){
							// 파일 저장
							is.transferTo(fos);
							
							// 업로드 결과 출력
// 							out.println("=======================================<br>");
// 							out.println("필드 이름 : " + fieldName + "<br>");
// 							out.println("원본 파일명 : " + fileName + "<br>");
// 							out.println("저장 파일명 : " + uploadedName + "<br>");
// 							out.println("타입 : " + item.getContentType() + "<br>");
// 							out.println("경로 : " + uploadedFile.getAbsolutePath() + "<br>");
// 							out.println("크기 : " + uploadedName.length() + "<br>");
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
					
				}
				
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	// System.out.println(request.getParameter("category"));
	ProductRepository productRepository = new ProductRepository();
// 	String file = request.getParameter("file");
// 	String productId = request.getParameter("productId");
// 	String name = request.getParameter("name");
// 	int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
// 	String description = request.getParameter("description");
// 	String manufacturer = request.getParameter("manufacturer");
// 	String category = request.getParameter("category");
// 	int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock"));
// 	String condition = request.getParameter("condition");
	product = Product.builder().productId(productId)
							   .name(name)
							   .unitPrice(unitPrice)
							   .description(description)
							   .manufacturer(manufacturer)
							   .category(category)
							   .unitsInStock(unitsInStock)
							   .condition(condition)
							   .file(path + uploadedName)
							   .build();
	int result = productRepository.insert(product);
	
	if(result != 0) {
		System.out.println("상품 등록 완료!");
		response.sendRedirect(root + "/shop/products.jsp");
	}
	else {
		response.getWriter().println("<script>alert('상품 등록 실패');<script>");
		request.getRequestDispatcher(root + "/user/join.jsp").forward(request, response);
	}
	
%>