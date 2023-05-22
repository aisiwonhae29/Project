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
					<th>이름</th>
					<td>${rq.loginedMember.username }</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${rq.loginedMember.userage }</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>${rq.loginedMember.location }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${rq.loginedMember.usergender }</td>
				</tr>
				<tr>
					<th>email</th>
					<td>${rq.loginedMember.useremail }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${rq.loginedMember.nickname }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${rq.loginedMember.regDate }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${rq.loginedMember.cellphoneNum }</td>
				</tr>
		
			</tbody>
		</table>
		<a href="../member/checkPw?replaceUri=${Ut.getEncodedUri('../member/modify') }" class="btn btn-active btn-ghost">회원정보 	수정</a>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf" %> 