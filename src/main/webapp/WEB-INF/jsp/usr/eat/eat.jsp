<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<style>
#maingrid {
	display: grid;
	grid-template-columns: 10% 20% 20% 20% 20% 10%;
	grid-template-rows: 10% repeat(4, 20%) 10%;
	padding: 20px;
}
#rankbox{
	display: none;
	grid-column:2/4;
	grid-row:2/5
}
</style>
<div id="maingrid" class="bg-red-200 h-80">
		<div id="rankbox" class=" h-100p bg-red-200">
				<table class="table w-full">
						<caption id="ranktitle">
								<div class="btn btn-outline mb-1">오늘의 메뉴</div>
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
</div>
<%@ include file="../common/foot.jspf"%>