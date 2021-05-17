<%@page import="vo.AlreadyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../master/header.jsp" />
<%
	VaccineDAO dao = new VaccineDAO();
	ArrayList<AlreadyVO> list = dao.alreadyList();
%>

<section>
	<div class="container">
		<p class="title">에방접종 회원목록</p>
		<%
			if (!list.isEmpty()) {
		%>
		<table>
			<tr>
				<td>접종코드</td>
				<td>회원코드</td>
				<td>회원이름</td>
				<td>백신코드</td>
				<td>백신명</td>
				<td>접종날짜</td>
			</tr>

			<%
				for (AlreadyVO vo : list) {
			%>
			<tr>
				<td><%=vo.getP_seno()%></td>
				<td><%=vo.getP_no()%></td>
				<td><%=vo.getP_name()%></td>
				<td><%=vo.getI_code()%></td>
				<td><%=vo.getI_name()%></td>
				<td><%=vo.getP_date()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<p style="text-align: center">등록된 예방접종 회원목록이 없습니다</p>

		<%
			}
		%>
	</div>
</section>
<jsp:include page="../master/footer.jsp" />