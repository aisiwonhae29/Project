<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="join" />
<%@ include file="../common/head.jspf"%>
<div class="login_Box border mx-auto flex justify-center">
  <form action="../member/doJoin" method="POST" onsubmit='check(this); return false;'>
    <ol class="h-full flex flex-col items-center justify-around">
      <li>
        <div class="inputName">ID</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userid" onblur="dupCheck()">
        <div id="dupCheck-msg"></div>	
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
<script>
function check(form){
	if(form.userid.value.trim()==0){
		alert('id를 입력해주세요');
		return;
	}
	if(form.userpw.value.trim()==0){
		alert('비밀번호를 입력해주세요');
		return;
	}
	if(form.username.value.trim()==0){
		alert('이름를 입력해주세요');
		return;
	}
	if(form.userage.value.trim()==0){
		alert('나이를 입력해주세요');
		return;
	}
	if(form.userlocation.value.trim()==0){
		alert('지역을 입력해주세요');
		return;
	}
	if(form.usergender.value.trim()!="남"&&form.usergender.value.trim()!="여"){
		alert('남/여 중 하나를 입력해주세요')
		return;
	}
	form.submit();
}

function dupCheck(){
	  $.ajax({
          type: "POST",
          url: "../member/getLoginIdDup",
          data: {loginId : $(".input").attr('value')},
          dataType: "dataType",
          success: function (response) {
              alert('asd');
          }
      });
}
</script>
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