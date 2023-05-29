<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="뭐가맛있지?" />
<%@ include file="../common/head.jspf"%>
<style>
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
		conditionbox.push($(element).attr('type'));
		$(element).attr('class','btn m-0.5 btn-secondary')
	}else{
		$(element).attr('class',"btn btn-outline m-0.5");
		var findIndex = conditionbox.indexOf($(element).attr('type'));
		conditionbox.splice(findIndex, 1);
	}
	/* console.log('end'+conditionbox); */
}

 function searchRank(){
	$.ajax({
	    type: "post",
	    url: "url",
	    data: {},
	    dataType: "dataType",
	    success: function (response) {
	        
	    }
	});
} 

</script>
<body>

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
												<td>
														<a rel="rankfoodimg1" onmousemove="pickimage(this)" id="1stRankval"
																href="/usr/today/where?menu=${mainRankLists[0].menuname }">${mainRankLists[0].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">2</td>
												<td>
														<a rel="rankfoodimg2" onmousemove="pickimage(this)" id="2ndRankval"
																href="/usr/today/where?menu=${mainRankLists[1].menuname }">${mainRankLists[1].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">3</td>
												<td>
														<a rel="rankfoodimg3" onmousemove="pickimage(this)" id="3rdRankval"
																href="/usr/today/where?menu=${mainRankLists[2].menuname }">${mainRankLists[2].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">4</td>
												<td>
														<a rel="rankfoodimg4" onmousemove="pickimage(this)" id="4thRankval"
																href="/usr/today/where?menu=${mainRankLists[3].menuname }">${mainRankLists[3].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">5</td>
												<td>
														<a rel="rankfoodimg5" onmousemove="pickimage(this)" id="5thRankval"
																href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a>
												</td>
										</tr>
								</tbody>
						</table>
				</div>
				<div id="selectbox" class="">
						<div id="select_items_1 ">
								<div type= "age" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#20대</div>
								<div type= "age" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#30대</div>
								<div type= "age" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#40대</div>
								<div type= "age" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#50대</div>
								<div type= "age" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#60+</div>
						</div>
						<div id="select_items_2">
								<div type="gen" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#남자</div>
								<div type="gen" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#여자</div>
						</div>
						<div id="select_items_1 ">
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#한식</div>
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#중식</div>
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#양식</div>
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#일식</div>
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#동남아</div>
								<div type="fud" class="btn btn-outline m-0.5" onclick="findWithCondition(this)">#인도</div>
						</div>
				</div>
				<div id="randombox" class="h-full ">
						<table class="table w-5/6">
								<caption id="ranktitle">
										<div class="btn btn-outline mb-1"></div>
								</caption>
								<thead>
										<th id="no" class="text-center">Top</th>
										<th id="menu" class="text-center">menu</th>
								</thead>
								<tbody>
										<tr class="menulist">
												<td class="text-center">1</td>
												<td>
														<a rel="rankfoodimg1" onmousemove="pickimage(this)" id="1stRankval2"
																href="/usr/today/where?menu=${mainRankLists[0].menuname }">${mainRankLists[0].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">2</td>
												<td>
														<a rel="rankfoodimg2" onmousemove="pickimage(this)" id="2ndRankval2"
																href="/usr/today/where?menu=${mainRankLists[1].menuname }">${mainRankLists[1].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">3</td>
												<td>
														<a rel="rankfoodimg3" onmousemove="pickimage(this)" id="3rdRankval2"
																href="/usr/today/where?menu=${mainRankLists[2].menuname }">${mainRankLists[2].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">4</td>
												<td>
														<a rel="rankfoodimg4" onmousemove="pickimage(this)" id="4thRankval2"
																href="/usr/today/where?menu=${mainRankLists[3].menuname }">${mainRankLists[3].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">5</td>
												<td>
														<a rel="rankfoodimg5" onmousemove="pickimage(this)" id="5thRankval2"
																href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">6</td>
												<td>
														<a rel="rankfoodimg5" onmousemove="pickimage(this)" id="6thRankval2"
																href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a>
												</td>
										</tr>
										<tr class="menulist">
												<td class="text-center">7</td>
												<td>
														<a rel="rankfoodimg5" onmousemove="pickimage(this)" id="7thRankval2"
																href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a>
												</td>
										</tr>
								</tbody>
						</table>
				</div>
		</div>
		<%@ include file="../common/foot.jspf"%>