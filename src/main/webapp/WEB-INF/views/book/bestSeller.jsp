<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - BestSeller</title>
<link rel="stylesheet" href="resources/css/bestSeller.css">
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3"><a href="memberEdit">마이페이지</a></td>
				<td class="top4"><a href="login">로그아웃</a></td>
			</tr>
		</table>
	</div>

	<div class="content">
	
		<div class="navi">
			<table class="naviTable">
				<tr>
					<td class="navi1">베스트셀러</td>	<!-- 추후 API 사용 -->
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="">종합</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="">건강/취미</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="">경제경영</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="">고전</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="">과학</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="">대학교재/전문서적</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->
		
		<div class="bs">
		
			<div class="bshead">
				<table class="bsBtTable">
					<tr>
						<td class="bsSpan">종합</td>
						<td><button class="week"><a href="">주간 베스트</a></button></td>
						<td><button class="month"><a href="">월간 베스트</a></button></td>
						<td><button class="year"><a href="">연간 베스트</a></button></td>
					</tr>
				</table>
			</div>

			<div class="bsTableDiv">
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">1.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkO.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">2.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">3.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">4.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">5.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">6.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">7.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">8.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">9.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">10.</td>
						<td class="bs1td3"><a href=""><img class="bookMarkImg" src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
			</div>
			<!-- bsTableDiv -->
		</div>
		<!-- bs -->

	</div>
	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageLeft.png"></a></td>
				<td><a class="bold">1</a></td>
				<td><a href="">2</a></td>
				<td><a href="">3</a></td>
				<td><a href="">4</a></td>
				<td><a href="">5</a></td>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageRight.png"></a></td>
			</tr>
		</table>
	</div>

</body>
</html>