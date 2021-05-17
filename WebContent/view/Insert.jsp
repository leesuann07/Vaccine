<%@page import="dao.VaccineDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../master/header.jsp" />
<%
VaccineDAO dao = new VaccineDAO();
int pseno = dao.getMaxpseno();
%>

<section>
	<div class="container">
		<p class="title">주사접종 등록</p>
		<form action="InsertPro.jsp" method="post" name="frm">
			<table width="600px">
				<tr>
					<td>접종코드</td>
					<td><input type="number" value="<%= pseno %>" id="p_seno" name="p_seno" readonly="readonly"></td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" id="i_code" name="i_code"></td>
				</tr>
				<tr>
					<td>회원코드</td>
					<td><input type="text" id="p_no" name="p_no"></td>
				</tr>
				<tr>
					<td>접종날짜</td>
					<td><input type="date" id="p_date" name="p_date"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"
						onclick="return checkForm()"> <input type="reset"
						value="초기화"></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<script>
	function checkForm() {
		if (document.frm.p_seno.value.trim() == "") {
			alert("접종코드 입력");
			document.frm.p_seno.focus();
			return false;
		}
		if (document.frm.i_code.value.trim() == "") {
			alert("백신코드 입력");
			document.frm.i_code.focus();
			return false;
		}
		if (document.frm.p_no.value.trim() == "") {
			alert("회원코드 입력");
			document.frm.p_no.focus();
			return false;
		}
		if (document.frm.p_date.value.trim() == "") {
			alert("접종날짜 입력");
			document.frm.p_date.focus();
			return false;
		} else {
			document.frm.submit();
			alert("완료");
			return true;
		}
	}
</script>

<jsp:include page="../master/footer.jsp" />