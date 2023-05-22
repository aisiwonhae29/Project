<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>

<hr />
<div></div>
 <style>
        #no{ width: 100px; }
        #menu{width: 200px;}
        th{ border: 1px solid #000;}
        tr{ border-bottom: 1px solid rgb(250,87,87);}
        .menulist:hover{background-color: rgb(250,87,87); transition: 1s; opacity: 0.5; ;} 
        .menulist>td>a{display: block;  text-align: center;}   
        </style>
    <section class="mainrank absolute w-full bottom-32 ">
    <div class="flex justify-around items-center">
		<div id="rankbox">
				<table>
						<caption id="ranktitle">오늘의 메뉴</caption>
						<thead>
							<th id="no">Top</th>
							<th id="menu">menu</th>
						</thead>
                        <tbody>
                            <tr class="menulist">
                                <td class="text-center">1</td>
                                <td><a href="/usr/today/where?menu=${mainRankLists[0].menuname }">${mainRankLists[0].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">2</td>
                                <td><a href="/usr/today/where?menu=${mainRankLists[1].menuname }">${mainRankLists[1].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">3</td>
                                <td><a href="/usr/today/where?menu=${mainRankLists[2].menuname }">${mainRankLists[2].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">4</td>
                                <td><a href="/usr/today/where?menu=${mainRankLists[3].menuname }">${mainRankLists[3].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">5</td>
                                <td><a href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a></td>
                            </tr>
                        </tbody>
				</table>
		</div>
        <div id="imgbox">
            d
        </div>
</div>
</section>
<%@ include file="../common/foot.jspf"%>