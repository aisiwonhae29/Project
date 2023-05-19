<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="menuselec"/>
<%@ include file="../common/head.jspf" %>
<div id="map" style="width:500px;height:400px;"></div>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56df77a2193b126495f95035a4f0197f"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);

		curl -v -X GET "https://dapi.kakao.com/v2/local/search/address.json" \
		  -H "Authorization: KakaoAK ${REST_API_KEY}" \
		  --data-urlencode "query=전북 삼성동 100" 
		
	</script>

<%@ include file="../common/foot.jspf" %>