<%@page import="dao.VaccineDAO"%>
<%@page import="vo.AlreadyVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int p_seno = Integer.parseInt(request.getParameter("p_seno"));
	String i_code = request.getParameter("i_code");
	String p_no = request.getParameter("p_no");
	Date p_date = Date.valueOf(request.getParameter("p_date"));

	AlreadyVO vo = new AlreadyVO();
	vo.setP_seno(p_seno);
	vo.setI_code(i_code);
	vo.setP_no(p_no);
	vo.setP_date(p_date);

	VaccineDAO dao = new VaccineDAO();
	int n = dao.vaccineInsert(vo);

	if (n > 0) {
		response.sendRedirect("/view/InjectionList.jsp");
	} else {
%>

<script>
	history.back();
</script>


<%
	}
%>