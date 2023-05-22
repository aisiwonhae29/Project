<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="join" />
<%@ include file="../common/head.jspf"%>
<div class="login_Box border mx-auto flex justify-center">
  <form action="../member/doJoin" method="POST" onsubmit='check(this); return false;'>
    <ol class="h-full flex flex-col items-center justify-around">
      <li id="idbox">
        <div class="inputName" id="idChecker">ID</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userid" onblur="iddupCheck()">
        <div id="dupCheck-msg"></div>
        <style>
        	#idbox{position: relative;}
        	#dupCheck-msg{position: absolute; top: 100%; left: 55px;}
        </style>
      </li>
      <li>
        <div class="inputName">PW</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="userpw">
      </li>
       <li id="emailbox">
        <div class="inputName">이메일</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="useremail" onblur="emaildupCheck()">
         <div id="emaildupCheck-msg"></div>
         <style>
       		 #emailbox{position: relative;}
       		 #emaildupCheck-msg{position: absolute; top: 100%; left: 55px;}
        </style>
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
        <input class="w-56 border-b-2 border-red-600" type="text" name="location">
      </li>
      <li>
        <div class="inputName">성별</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="usergender">
      </li>
       <li>
        <div class="inputName">별명</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="nickname">
      </li>
       <li>
        <div class="inputName">h.p</div>
        <input class="w-56 border-b-2 border-red-600" type="text" name="cellphoneNum">
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
	if(!$.isNumeric(form.userage.value.trim())){
		alert('나이항목에 숫자를 입력해주세요');
		return;
	}
	if(form.location.value.trim()==0){
		alert('지역을 입력해주세요');
		return;
	}
	if(form.usergender.value.trim()!="남"&&form.usergender.value.trim()!="여"){
		alert('남/여 중 하나를 입력해주세요')
		return;
	}
	if(form.nickname.value.trim()==0){
		alert('닉네임을 입력해주세요');
		return;
	}
	if(form.cellphoneNum.value.trim()==0){
		alert('핸드폰 번호를 입력해주세요');
		return;
	}
	form.submit();
}

function iddupCheck(){
	  $.ajax({
          type: "POST",
          url: "../member/getLoginIdDup",
          data: {loginId : $('input[name^=userid]').val()},
          dataType: "json",
          success: function (response) {
            	if( response['resultCode']=="S-1" ){
            		$('#dupCheck-msg').css('color','black');
            		$('#dupCheck-msg').html("사용가능한 아이디 입니다");
            	} else{
            		$('#dupCheck-msg').css('color','red');
            		$('#dupCheck-msg').html("사용 불가능한 아이디 입니다");
            	}
        	/*   alert( response['resultCode']   ); */
/*               {"resultCode":"F-1","msg":"아이디를 입력해주세요","data1":null,"data1Name":null,"fail":true,"success":false} */
          }
      });
}
function emaildupCheck(){
	  $.ajax({
        type: "POST",
        url: "../member/getemailDup",
        data: {useremail : $('input[name^=useremail]').val()},
        dataType: "json",
        success: function (response) {
          	if( response['resultCode']=="S-1" ){
          		$('#emaildupCheck-msg').css('color','black');
          		$('#emaildupCheck-msg').html("사용가능한 이메일 입니다");
          	} else{
          		$('#emaildupCheck-msg').css('color','red');
          		$('#emaildupCheck-msg').html("사용 불가능한 이메일 입니다");
          	}
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
  height: 600px;
}
</style>

<%@ include file="../common/foot.jspf"%>