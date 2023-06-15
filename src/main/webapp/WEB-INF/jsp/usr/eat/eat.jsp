<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="뭐가맛있지?" />
<%@ include file="../common/head.jspf"%>
<style>
#randomtable{
	
	width: 600px;
}
#maingrid {
	display: grid;
	height: 640px;
	grid-template-columns: 10% 20% 20% 20% 20% 10%;
	grid-template-rows: 10% repeat(4, 20%) 10%;
}

#rankbox {
	grid-column: 2/4;
	grid-row: 1/5;
}

#randombox {
	grid-column: 4/6;
	grid-row: 1/5;
}

#selectbox {
	grid-column: 2/4;
	grid-row: 5;
}
</style>
<script>
var conditionbox=[];
var conditionvaluebox=[];
function findWithCondition(element){
	//alert($(element).attr('type'));
	if($(element).attr('class')=="btn btn-outline m-0.5"){
		/* console.log('first'+conditionbox); */
		if(conditionbox.length>1){
			alert("2개이상은 못골라용 ^^;;");
			return false;
		}
		if(conditionbox[0]==$(element).attr('type')){
			alert('같은조건 2개는 못골라용 ^^;;');
			return false;
		}
		if(conditionbox[1]==$(element).attr('type')){
			alert('같은조건 2개는 못골라용 ^^;;');
			return false;
		}
		/* alert($(element).text());  */
		conditionbox.push($(element).attr('type'));
		conditionvaluebox.push($(element).text());
		/* conditionvaluebox.push($(element).textContent); */
		$(element).attr('class','btn m-0.5 btn-secondary');
		if(conditionbox.length==1){
			searchRank();
		};
		if(conditionbox.length==2){
			searchRankdouble();
		}
	}else{
		$(element).attr('class',"btn btn-outline m-0.5");
		var findIndex = conditionbox.indexOf($(element).attr('type'));
		conditionbox.splice(findIndex, 1);
		conditionvaluebox.splice(findIndex,1);
		if(conditionbox.length==1){
			searchRank();
		}
  	}
	console.log(conditionvaluebox);
	/* console.log('end'+conditionbox); */
}

 function searchRank(){
	$.ajax({
	    type: "post",
	    url: "../today/getRankList",
	    data: {"el1" : conditionbox[0]+conditionvaluebox[0]},
	    dataType: "text",
	    success: function (response) {
	    	var array = JSON.parse(response);

	    	var v1 = (array[0]?.menuname == null) ? " " : array[0].menuname ;
	    	var v2 = (array[1]?.menuname == null) ? " " : array[1].menuname ;
	    	var v3 = (array[2]?.menuname == null) ? " " : array[2].menuname ;
	    	var v4 = (array[3]?.menuname == null) ? " " : array[3].menuname ;
	    	var v5 = (array[4]?.menuname == null) ? " " : array[4].menuname ;
	    	
	    	$('#1stRankval').text(v1); $('#1stRankval').attr('href','../today/where?menu='+v1) ;
	    	$('#2ndRankval').text(v2); $('#2ndRankval').attr('href','../today/where?menu='+v2) ;
	    	$('#3rdRankval').text(v3); $('#3rdRankval').attr('href','../today/where?menu='+v3) ;
	    	$('#4thRankval').text(v4); $('#4thRankval').attr('href','../today/where?menu='+v4) ;
	    	$('#5thRankval').text(v5); $('#5thRankval').attr('href','../today/where?menu='+v5) ;
	    }
	});
} 
 function searchRankdouble(){
		$.ajax({
		    type: "post",
		    url: "../today/getRankListDoubleCons",
		    data: {"el1" : conditionbox[0]+conditionvaluebox[0], "el2" : conditionbox[1]+conditionvaluebox[1]},
		    dataType: "text",
		    success: function (response) {
		    	var array = JSON.parse(response);

		    	var v1 = (array[0]?.menuname == null) ? " " : array[0].menuname ;
		    	var v2 = (array[1]?.menuname == null) ? " " : array[1].menuname ;
		    	var v3 = (array[2]?.menuname == null) ? " " : array[2].menuname ;
		    	var v4 = (array[3]?.menuname == null) ? " " : array[3].menuname ;
		    	var v5 = (array[4]?.menuname == null) ? " " : array[4].menuname ;
		    	
		    	$('#1stRankval').text(v1); $('#1stRankval').attr('href','../today/where?menu='+v1) ;
		    	$('#2ndRankval').text(v2); $('#2ndRankval').attr('href','../today/where?menu='+v2) ;
		    	$('#3rdRankval').text(v3); $('#3rdRankval').attr('href','../today/where?menu='+v3) ;
		    	$('#4thRankval').text(v4); $('#4thRankval').attr('href','../today/where?menu='+v4) ;
		    	$('#5thRankval').text(v5); $('#5thRankval').attr('href','../today/where?menu='+v5) ;
		    }
		});
	} 

 //random menu pick
 var menuarray=[];
 var randomarrayindex=[];
 $(document).ready(function(){getMenu();});// set menu in array
 function getMenu(){
	 $.ajax({
		 type: "post",
		 url: "../today/getMenu",
		 success: function(response){
			 menuarray=response;
		 }
	 })
 }
 function randompick(){
	 var menuarrayLength=menuarray.length;
	 randomArraysetindex(menuarray)
	 for(var i=0; i<7; i++){
		 var Index=6-i;
		 window["randitem"+Index]=randomarrayel($(".child").eq(Index)); 
		 clearIntervalSet(window["randitem"+Index], i);
		 setinrandomarray(Index, i, menuarray);
	 }
 }
 function setinrandomarray(Index, i, menuarray){
	 setTimeout(()=>{
		 $(".child").eq(Index).text(menuarray[randomarrayindex[i]].menuname);
		 $(".child").eq(Index).attr('href','../today/where?menu='+menuarray[randomarrayindex[i]].menuname) ;
		 console.log(menuarray[randomarrayindex[i]].menuname);
	 }, 1000*i+1300);
 }
/*  function a(){
	 randomArraysetindex(menuarray);
 } */
 
 //set random array index with inserted array
 function randomArraysetindex(array){
	 var arlength = array.length;
	 randomarrayindex=[];
	 for (var j=0; j<7; j++){
		 while(true){
			 var ranidx = Math.floor(Math.random()*array.length);
			 if(!randomarrayindex.includes(ranidx)){
				 randomarrayindex.push(ranidx);
				 break;
			 }
		 }
	 }
	 return randomarrayindex;
 }
 //random menuname display
 function clearIntervalSet(el, i){
	setTimeout(() => {
		clearInterval(el);
	}, 1000*i+1000);
	
 }

 function randomarrayel(el){
	 var set = setInterval(function(){
	 $(el).text(menuarray[Math.floor(Math.random()*menuarray.length)].menuname)
	 }, 50
	)
	return set;
 }
 function aaa(){
	 $(".child").eq(1).text("asd");
 }
</script>
<body>
<!-- <button onclick="randomarrayel(this)">here</button>
<button onclick="a()">testcase</button>
<button onclick="aaa()" id="sss">asdasd</button> -->
		<div id="maingrid">
				<div id="rankbox" class="h-full">
						<table class="table w-5/6">
								<caption id="selection_box">
										<div class="btn btn-outline mb-1">누가 뭘먹지?</div>
								</caption>
								<thead>
										<th id="no" class="text-center">Top</th>
										<th id="menu" class="text-center">menu</th>
								</thead>
								<tbody>
										<tr class="menulist">
												<td class="text-center">1</td>
												<td >
														<a rel="rankfoodimg1"  id="1stRankval" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">2</td>
												<td>
														<a rel="rankfoodimg2" id="2ndRankval" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">3</td>
												<td>
														<a rel="rankfoodimg3" id="3rdRankval" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">4</td>
												<td>
														<a rel="rankfoodimg4" id="4thRankval" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">5</td>
												<td>
														<a rel="rankfoodimg5" id="5thRankval" href="/usr/today/where?menu="></a>
												</td>
										</tr>
								</tbody>
						</table>
				</div>
				<div id="selectbox" class="">
						<div id="select_items_1 ">
								<div type="userage" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#20대</div>
								<div type="userage" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#30대</div>
								<div type="userage" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#40대</div>
								<div type="userage" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#50대</div>
								<div type="userage" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#60+</div>
						</div>
						<div id="select_items_2">
								<div type="usergender" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#남자</div>
								<div type="usergender" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#여자</div>
						</div>
						<div id="select_items_1 ">
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#한식</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#중식</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#양식</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#일식</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#동남아</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#분식</div>
								<div type="foodtype" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#기타</div>
						</div>
				</div>
				<div id="randombox" class="h-full ">
						<table class="table" id="randomtable">
								<caption id="ranktitle">
										<div onclick="randompick()" class="btn btn-outline mb-1">random 뽑기~</div>
								</caption>
								<thead>
										<th id="no" class="text-center">Top</th>
										<th id="menu" class="text-center">menu</th>
								</thead>
								<tbody>
										<tr class="menulistrd">
												<td class="text-center">1</td>
												<td class="text-center">
														<a class="child" rel="1randomel" id="1stRankval2" href="/usr/today/where?menu="></a>												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">2</td>
												<td class="text-center">
														<a class="child" rel="2randomel" id="2ndRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">3</td>
												<td class="text-center">
														<a class="child" rel="3randomel" id="3rdRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">4</td>
												<td class="text-center">
														<a class="child " rel="4randomel" id="4thRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">5</td>
												<td class="text-center">
														<a class="child" rel="5randomel" id="5thRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">6</td>
												<td class="text-center">
														<a class="child" rel="6randomel" id="6thRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
										<tr class="menulistrd">
												<td class="text-center">7</td>
												<td class="text-center">
														<a class="child" rel="7randomel" id="7thRankval2" href="/usr/today/where?menu="></a>
												</td>
										</tr>
								</tbody>
						</table>
				</div>
		</div>
		<%@ include file="../common/foot.jspf"%>