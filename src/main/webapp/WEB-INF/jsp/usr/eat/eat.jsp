<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>

		<table>
						<caption id="ranktitle">오늘의 메뉴</caption>
						<thead>
							<th id="no">Top</th>
							<th id="menu">menu</th>
						</thead>
                        <tbody>
                            <tr class="menulist">
                                <td class="text-center">1</td>
                                <td><a onmousemove="pickimage(this)" id="1stRankval" href="/usr/today/where?menu=${mainRankLists[0].menuname }">${mainRankLists[0].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">2</td>
                                <td><a onmousemove="pickimage(this)" id="2ndRankval" href="/usr/today/where?menu=${mainRankLists[1].menuname }">${mainRankLists[1].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">3</td>
                                <td><a onmousemove="pickimage(this)" id="3rdRankval" href="/usr/today/where?menu=${mainRankLists[2].menuname }">${mainRankLists[2].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">4</td>
                                <td><a onmousemove="pickimage(this)" id="4thRankval" href="/usr/today/where?menu=${mainRankLists[3].menuname }">${mainRankLists[3].menuname }</a></td>
                            </tr>
                            <tr class="menulist">
                                <td class="text-center">5</td>
                                <td><a onmousemove="pickimage(this)" id="5thRankval" href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a></td>
                            </tr>
                        </tbody>
				</table>

<%@ include file="../common/foot.jspf"%>