
<%@include file="link.jsp"%>

<%
String error = (String) session.getAttribute("error");

if (error != null) {
%>

<div class="alert alert-danger alert-dismissible fade show text-center"
	role="alert">
	<strong class="text-center"><%=error%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
session.removeAttribute("error");

}
%>