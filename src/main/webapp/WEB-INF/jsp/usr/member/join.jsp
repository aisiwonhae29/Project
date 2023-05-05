<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="join" />
<%@ include file="../common/head.jspf"%>
<div class="login_Box border mx-auto flex justify-center">
  <form action="../member/doJoin" method="POST">
    <ol class="h-full flex flex-col items-center justify-around">
      <li>
        <div class="inputName">ID</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userid">
      </li>
      <li>
        <div class="inputName">PW</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userpw">
      </li>
      <li>
        <div class="inputName">이름</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="username">
      </li>
      <li>
        <div class="inputName">나이</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userage">
      </li>
      <li>
        <div class="inputName">위치</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userlocation">
      </li>
      <li>
        <div class="inputName">성별</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="usergender">
      </li>
    </ol>
    <div><button type="submit">버튼</button></div>
  </form>
</div>
<style>
.inputName {
  display: inline-block;
  text-align: center;
  width: 50px;
}
.login_Box{
  width: 400px;
  height: 500px;
}
</style>

<%@ include file="../common/foot.jspf"%>