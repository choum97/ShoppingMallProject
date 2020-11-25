<%@ page contentType="text/html; charset=utf-8"  %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	request.setCharacterEncoding("UTF-8");

	String proudctId = request.getParameter("proudctId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unintsInStock = request.getParameter("unintsInStock");
	String condition = request.getParameter("condition");
	
	Integer price;
	
	long stock;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	if(unintsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unintsInStock);
		//stock = Long.valueOf(unintsInStock);
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(proudctId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	dao.addProduct(newProduct);
	response.sendRedirect("prducts.jsp");
%>
