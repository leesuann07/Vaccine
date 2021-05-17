<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../master/header.jsp" />
<%
	VaccineDAO dao = new VaccineDAO();
	ArrayList<MemberVO> list = dao.memberList();
%>

<section>
	<div class="container">
		<p class="title">회원 목록</p>

		<%
			if (!list.isEmpty()) {
		%>
		
		<table>
			<tr>
				<td>회원코드</td>
				<td>회원이름</td>
				<td>생년월일</td>
				<td>전화번호</td>
				<td>성별</td>
				<td>도시코드</td>
			</tr>
			<%
				for (MemberVO vo : list) {
			%>

			<tr>
				<td><%=vo.getP_no()%></td>
				<td><%=vo.getP_name()%></td>
				<td><%=vo.getP_birth()%></td>
				<td><%=vo.getP_tel()%></td>
				<td><%=vo.getP_gender()%></td>
				<td><%=vo.getP_city()%></td>
			</tr>

			<%
				}
			%>

		</table>
		
		<%
			} else {
		%>
		<p style="text-align: center">등록된 회원목록이 없습니다</p>

		<%
			}
		%>

	</div>
</section>

<jsp:include page="../master/footer.jsp" />