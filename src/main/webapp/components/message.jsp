
<%@include file="link.jsp"%>

<%
String message = (String) session.getAttribute("message");

if (message != null) {
	//print message
%>

<div class="alert alert-success alert-dismissible fade show text-center"
	role="alert">
	<strong class="text-center"><%=message%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
//remove message
session.removeAttribute("message");
}
%>