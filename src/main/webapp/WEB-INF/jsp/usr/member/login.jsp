<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<div class="login_box flex flex-ai-c flex-column">
  <div class="login_box_title">Login</div>
  <div>
    <div>id</div><input type="text" name="id" />
  </div>
  <div>
    <div>pw</div><input type="text" name="pw" />
  </div>
  <div class="submit_box"><a href="https://naver.com" target="_blank" type="submit" onclick="#">log in</a></div><br>
  <div>
    <a href="#">회원가입</a>/<a href="#">아이디 찾기</a>
  </div>
</div>
<%@ include file="../common/foot.jspf"%>