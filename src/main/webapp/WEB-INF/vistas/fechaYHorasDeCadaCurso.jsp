<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- meta, css, vendor, etc. -->
<%@ include file="../../parts/meta.jsp" %> 
	<!-- fin del meta, css, vendor, etc -->
	<!-- Header -->
<%@ include file="../../parts/header.jsp" %> 
	<!-- fin header -->
	<!-- Sidebar -->
<%@ include file="../../parts/sidebar.jsp" %> 
	<!-- fin sidebar -->
</head>
<body class="animsition">


	


	<!-- Our Story -->
	<section class="bg1-pattern p-t-120 p-b-105">
		
		
<c:if test="${num == 0 }">		
		
		<div class="container">
		<div class="tit2 text-center m-t-80">
			 No estas realizando ningun curso en este momento
		</div>
<a href="listadoCursos" class="btn3 flex-c-m size13 text-center txt11 trans-0-4 m-l-r-auto m-t-20">
					Anotarme a un curso
				</a>
	<!--	<h3 class="tit3 t-center m-b-35 m-t-5">
			Seccion Principal
		</h3>
-->
		
					<p class="t-center m-b-22 size3 m-l-r-auto m-b-70 m-t-15">
					�Que est�s esperando? Anotate y aprend� a manejar junto a nuestros instructores.
						</p>
		
		
		
</c:if>
		
		
			<!-- Delicious -->
			<div class="row">
				<div class="col-md-12 p-t-45 p-b-30 ">
					<div class="wrap-text-welcome t-center">
						
<c:if test="${num > 0 }">

		<h3 class="tit3 text-center m-b-35 m-t-5">
							Mis cursos
						</h3>
		
	
  		
	
	
	<p class="text-center">Quiero dejar de hacer el curso de: </p>
	<c:forEach items="${listaCursos}" var="la">

		
<form:form  method="POST" modelAttribute="agenda" action="mostrarAlerta">
<label class="checkbox-inline">
${la.curso.especialidad.tipo} ${la.curso.especialidad.id}
</label>


<input name="idCurso" type="hidden" value="${la.curso.especialidad.id}"></input>
    
    <button type="submit" class="btn3 flex-c-m txt11 trans-0-4 m-l-r-auto btn-sm m-b-20 ">
          Eliminar 
    </button>
        
</form:form>      
    </c:forEach>	
	
		












						<h3 class="tit3 text-center m-b-35 m-t-5">
							Calendario de Clases
						</h3>
		
	
  		
<form:form action="clasesDelCurso" method="get">	
	
	<p class="text-center">Solo ver mis clases de: </p>
	<c:forEach items="${listaCursos}" var="la">

		
<label class="checkbox-inline">
	<input type="radio" class="m-l-15"  name="id" value="${la.curso.especialidad.id}"/> ${la.curso.especialidad.tipo}
 </label>
    
    </c:forEach>	
	
		<button type="submit" class="btn3 flex-c-m txt11 trans-0-4 m-l-r-auto btn-sm m-b-20 ">
          <span class="glyphicon glyphicon-pencil"> </span> Buscar 
        </button>
</form:form>	
		
		
		
<div class="row">
<c:forEach items="${listadoClases}" var="la">


<div class="col-md-4 ">

  <h2 class="text-center color0-hov trans-0-4 bg-dark text-white">Curso de ${la.inscripcion.curso.especialidad.tipo}</h2>
		
		 <p class="card-text text-center"><b class="color0-hov trans-0-4">Fecha</b>: ${la.fecha}<br>
	<b class="color0-hov trans-0-4 text-center">Hora:</b> ${la.hora}<br>
		
		<b class="color0-hov trans-0-4 text-center">Instructor:</b> ${la.instructorVehiculoEspecialidad.instructor.usuario.nombre} ${la.instructorVehiculoEspecialidad.instructor.usuario.apellido}<br>
		
		<b class="color0-hov trans-0-4 text-center">Vehiculo:</b> ${la.instructorVehiculoEspecialidad.vehiculo.modelo} ${la.instructorVehiculoEspecialidad.vehiculo.patente}</p>
		
		
		<br>
<button type="button" class="btn3 flex-c-m txt11 trans-0-4 m-l-r-auto btn-sm">
          <span class="glyphicon glyphicon-pencil"> </span> EDITAR 
        </button>
        
        			
        			
        			
        				     <!-- BOTON ELIMINAR -->
     <br><br>   
<form:form  method="POST" modelAttribute="agenda" action="mostrarAlerta">

			<input name="idAgendaSeleccionada" type="hidden" value="${la.id}"></input>
		
	   <button type="submit" class="btn3 flex-c-m txt11 trans-0-4 m-l-r-auto btn-sm">
         ELIMINAR 
        </button>
	
	
</form:form> 
								<!--FIN  BOTON ELIMINAR -->
        
        
        
        
        
        
 </div>

</c:forEach>       
   							
   	</div>						
   							
   			
</div>	
</c:if>
						
						
						
						
					</div>
				</div>

				
			</div>


			
		</div>
	</section>
	
	
<!-- Footer -->
<%@ include file="../../parts/footer.jsp" %> 
	<!-- fin footer  -->

</body>
</html>