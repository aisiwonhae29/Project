<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<div class="login_Box border mx-auto flex justify-center">
  <form action="">
    <ol class="h-full flex flex-col items-center justify-around">
      <li>
        <div class="inputName">ID</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
      <li>
        <div class="inputName">PW</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
      <li>
        <div class="inputName">이름</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
      <li>
        <div class="inputName">나이</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
      <li>
        <div class="inputName">성별</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
      <li>
        <div class="inputName">위치</div><input class="w-56 border-b-2 border-red-600" type="text">
      </li>
    </ol>
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