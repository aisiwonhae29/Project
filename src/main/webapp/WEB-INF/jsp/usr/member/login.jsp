<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<div class="login_box flex flex-ai-c flex-column">
  <div class="login_box_title">Login</div>
   <form action="../member/doLogin" method="POST">
  <div>
    <div>id</div><input type="text" name="userid" />
  </div>
  <div>
    <div>pw</div><input type="text" name="userpw" />
  </div>
  <div class="submit_box">
  	<button type="submit">login</button>
  	<!-- <a href="../member/doLogin" type="submit">log in</a> -->
  </div><br>
 </form>
  <div>
    <a href="#">회원가입</a>/<a href="#">아이디 찾기</a>
  </div>
</div>
<%@ include file="../common/foot.jspf"%>