<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="myPage" />
<%@ include file="../common/head.jspf" %>
<style>
</style>
<section>
	<div>
		<div>
		<table>
			<colgroup>
				<col />
			</colgroup>
			<thead>
				
			</thead>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${rq.loginedMember.userid }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${rq.loginedMember.userpw }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${rq.loginedMember.username }</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${rq.loginedMember.userage }</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>${rq.loginedMember.userlocation }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${rq.loginedMember.usergender }</td>
				</tr>
				<c:set>
				<tr>
					<th>아이디</th>
					<td>${rq.loginedMember.userid }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${rq.loginedMember.userpw }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${rq.loginedMember.username }</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${rq.loginedMember.userage }</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>${rq.loginedMember.userlocation }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${rq.loginedMember.usergender }</td>
				</tr>
				</c:set>
			</tbody>
		</table>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf" %> 