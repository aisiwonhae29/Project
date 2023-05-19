<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>

<div>${number }</div>
<hr />

 <style>
        #no{ width: 100px; }
        #menu{width: 200px;}
        th{ border: 1px solid #000;}
        tr{ border-bottom: 1px solid rgb(250,87,87);}
        .menulist:hover{background-color: rgb(250,87,87); transition: 1s; opacity: 0.5; ;}    
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
                                <td></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">2</td>
                                <td></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">3</td>
                                <td></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">4</td>
                                <td></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">5</td>
                                <td ></td>
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