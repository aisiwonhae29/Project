<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="login" />
<%@ include file="../common/head.jspf"%>
<table class="table mx-auto" style="width: 300px;">
		<tr>
				<caption>
						<h3 class="login_box_title text-lg font-bold">Login</h3>
						
				</caption>
				<form action="../member/doLogin" method="POST">
						<tr >
								<td>
										<div>
												<div>id</div>
												<input style="width:280px" type="text" name="userid" />
										</div>
								</td>
						</tr>
						<tr>
								<td>
										<div>
												<div>pw</div>
												<input style="width:280px" type="text" name="userpw" />
										</div>
								</td>
						</tr>
						<tr>
								<td>
										<div class="submit_box text-right">
												<button class="btn btn-outline btn-info" type="submit">login</button>
												<!-- <a href="../member/doLogin" type="submit">log in</a> -->
										</div>
								</td>
						</tr>
						<br>
				</form>
		<tr>
				<td>
						<div class="text-center">
								<a href="#">아이디 찾기</a>
								/
								<a href="">비밀번호 찾기</a>
						</div>

				</td>
		</tr>
</table>

<%@ include file="../common/foot.jspf"%>