<%@page import="vo.InjectionVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../master/header.jsp" />
<%
	VaccineDAO dao = new VaccineDAO();
	ArrayList<InjectionVO> list = dao.injectionList();
%>
<section>
	<div class="container">
		<p class="title">백신별 접종 목록</p>
		<%
			if (!list.isEmpty()) {
		%>

		<table>
			<tr>
				<td>백신코드</td>
				<td>백신이름</td>
				<td>접종수</td>
			</tr>

			<%
				for (InjectionVO vo : list) {
			%>
			<tr>
				<td><%=vo.getI_code()%></td>
				<td><%=vo.getI_name()%></td>
				<td><%=vo.getCnt()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>

		<p style="text-align: center">등록된 백신접종 리스트가 없습니다</p>
		<%
			}
		%>
	</div>
</section>
<jsp:include page="../master/footer.jsp" />