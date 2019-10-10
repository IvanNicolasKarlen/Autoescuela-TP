<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Curso</title>
<!-- meta, css, vendor, etc. -->
<%@ include file="../../parts/meta.jsp"%>
<!-- fin del meta, css, vendor, etc -->
</head>
<body class="animsition">

	<!-- Header -->
	<%@ include file="../../parts/header.jsp"%>
	<!-- fin header -->
	<!-- Sidebar -->
	<%@ include file="../../parts/sidebar.jsp"%>

	<section class="section-reservation bg1-pattern p-t-100 p-b-113">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 p-b-30">
				<div class="t-center">
					
					<h3>${mensaje}</h3>
					<h3>${error}</h3>
					<form action="validarInstructor" method="post">
					<label class="txt9">Seleccione el vehiculo: </label>
						<select class="bo-rad-10 sizefull txt10 p-l-20" id="idv"
							name="idv">

							<c:forEach items="${listaV}" var="v">
								<option value="${v.id}">${v.modelo} - ${v.patente}</option>
							</c:forEach>

						</select> 
						<input style="display:none" name="iveId" value="${iveId}"> 
						<div class="wrap-btn-booking flex-c-m m-t-6">
							<button type="submit"
								class=" m-t-50 btn3 flex-c-m size13 txt11 trans-0-4">
								Continuar</button>
						</div>
					</form>
					
					<p>
						<a href="index">Volver al inicio</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Footer -->
	<%@ include file="../../parts/footer.jsp"%>
	<!-- fin footer  -->
</body>
</html>
</body>
</html>