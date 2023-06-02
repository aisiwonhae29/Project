<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="menuselec" />
<%@ include file="../common/head.jspf"%>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 600px;
}

#menu_wrap {
	top: 0;
	right: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px;
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

td, th {
	text-align: center;
	height: 50px;
}

.eatclickbox {
	height: 80px;
}

#goeat, #goeattogether {
	width: 200px;
}

#mapinfovaluebox {
	margin-left: auto;
	margin-right: auto;
	width: 400px;
}
</style>
<div class="map_wrap flex justify-around">
		<div id="leftBox">
				<div class="flex justify-between">
						<div id="myLocation" class="flex " style="font-size: 1rem;">대전 월평동</div>
						<button onclick="changemylocation()">현재 위치에서</button>
				</div>
				<div id="map" style="width: 600px; height: 100%; position: relative; overflow: hidden;"></div>
		</div>
		<div id="control_box" class="w-80">
				<table class="table">
						<tr>
								<th style="font-size: 1rem; height: 80px;">오늘 뭐먹지?</th>
						</tr>
						<tr>
								<td>
										<div class="btn btn-outline btn-error w-40 ">가게이름</div>
								</td>
						</tr>
						<tr>
								<td>
										<div id="shopname">어디?</div>
								</td>
						</tr>
						<tr>
								<td>
										<div class="btn btn-outline btn-error w-40">메뉴는?</div>
								</td>
						</tr>
						<tr>
								<td>
										<div id="foodmenuitem">뭐?</div>
								</td>
						</tr>
						<tr>
								<td>
										<div class="btn btn-outline btn-error w-40">주소</div>
								</td>
						</tr>
						<tr>
								<td>
										<div id="whereaddress">어디?</div>
								</td>
						</tr>
						<tr>
								<td class="eatclickbox">
										<form action="" method="">
												<div id="goeat" class="btn btn btn-primary">
														<input type="submit" value="점심먹으러 가요!" /> 
														

												</div>
												<div onclick="showgenderman()" id="showgenderman" style="width:40px" class="hidden">남</div>
												<div onclick="showgenderwom()" id="showgenderwom" style="width:40px" class="hidden">여</div>
												<div onclick="changeage()" id="showage" style="width:40px" class="btn btn-outline btn-success">age</div>
												<input type="hidden" value="" />
										</form>
								</td>
						</tr>
						<tr>
								<td class="eatclickbox">
										<div id="goeattogether" class="btn btn btn-primary">여러명이서 먹어요!</div>
										<div onclick="creategenderman()" id="creategenderman" style="width:40px" class="btn btn-outline btn-info">남</div>
										<div onclick="creategenderwom()" id="creategenderwom" style="width:40px" class="btn btn-outline btn-error">여</div>
								</td>
						</tr>

				</table>
		</div>
		<div id="menu_wrap" class="bg_white">
				<div class="option">
						<div>
								<form onsubmit="searchPlaces(); return false;">
										키워드 :
										<input type="text" value="${menu }" id="keyword" size="15">
										<button type="submit">검색하기</button>
								</form>
						</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
		</div>
</div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56df77a2193b126495f95035a4f0197f&libraries=services"></script>
<script>
//	show gender and bind value
$(document).ready(function(){
	if('${rq.loginedMember.usergender }'=='' || '${rq.loginedMember.usergender }'=='남'){
		showgenderwom();
	}else{
		showgenderman();
	}
	 //typeof variable !== 'undefined'
})
//	show age
function changeage(){
	var agearray=['10대','20대','30대','40대','50대','60+'];
	if(agearray.includes($('#showage').text())){
		$('#showage').text(agearray[(agearray.indexOf($('#showage').text())+1)%6]);
	}else{
		$('#showage').text('10대');
	}
}

function creategenderman(){
	var div = document.createElement("div");
}

function showgenderman(){
	$('#showgenderwom').attr('class',"btn btn-error");
	$('#showgenderman').attr('class',"hidden");
}
function showgenderwom(){
	$('#showgenderwom').attr('class',"hidden");
	$('#showgenderman').attr('class',"btn btn-info");
}
	
	var myaddress_name;
	$(document).ready(function() {
		addressshow();
	});
	function changemylocation() {
		getLocation();
		setTimeout(function() {
			addressshow();
		}, 1000);
		setTimeout(function() {
			searchPlaces();
		}, 1000);

	}
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(getPosition);
		} else {
			alert('권한을 설정하지 않으셨습니다');
			return false;
		}
	}
	function getPosition(position) {
		mylatitude = position.coords.latitude;
		mylongitude = position.coords.longitude;
	}
	/* function changemylocation(){
	 mylatitude=127.427;
	 mylongitude=36.3278;
	 searchPlaces();
	 addressshow();
	 } */
	function addressshow() {
		$.ajax({
			type : "GET",
			url : "https://dapi.kakao.com/v2/local/geo/coord2address.json",
			headers : {
				"Authorization" : "KakaoAK "
						+ "9878f9fec3164d6fb054ed74a47d98c8"
			},
			data : ({
				"x" : mylongitude,
				"y" : mylatitude
			}),
			contentType : "text/html; charset=utf-8",
			dataType : "json",
			success : function(response) {
				$('#myLocation').text(
						response.documents[0].address.address_name);
				myaddress_name = response.documents[0].address.address_name;
			}
		});
	}
	// ----------------------------------------variable control
	var query = "칼국수"
	var mylongitude = 127.427;
	var mylatitude = 36.3278;
	var querydocs;

	//키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB, {
			x : mylongitude,
			y : mylatitude
		});
	}
	setTimeout(() => {
		kakao.maps.event.addListener(map, 'dragend', function() {        
		
		    // 지도 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter(); 
		    
		    mylatitude=latlng.getLat();
		    mylongitude=latlng.getLng();
		    var keyword = document.getElementById('keyword').value;
		    ps.keywordSearch(keyword, placesSearchCB, {
				x : mylongitude,
				y : mylatitude
			});
		    setTimeout(()=>{
		    	clicklievent();	
		    }, 400);
			
		});
	}, 500);

	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			valuefinder = data;
			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(36.361, 127.375), // 지도의 중심좌표
		level : 1
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
				
			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		
		window["itemel"+index]= [{"주소":places.address_name},{"가게이름":places.place_name}]
		
		
		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray adn">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}
	var infoitemslists=[];
	
	 $(document).ready(function () {
		 clicklievent();
     });
	 function clicklievent(){
			$('.item').click(function(){
				$('#shopname').text($(this).find('div.info h5').text());
				$('#foodmenuitem').text($('#keyword')[0].value);
				$('#whereaddress').text($(this).find('div.info span.adn').text());
				console.log($(this).find('div.info span.jibun gray'));
			}); 
	 }
	 
	 
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>

<%@ include file="../common/foot.jspf"%>