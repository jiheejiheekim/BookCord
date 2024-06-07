<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - MyReview</title>
<link rel="stylesheet" href="resources/css/myReview.css">
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
					<td class="navi1">마이페이지</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="memberEdit">회원정보
							수정</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="myReview">나의 리뷰</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="myBookMark">나의 북마크</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->

		<div class="myReview">
			<span class="myReviewSpan">나의 리뷰</span>

			<div class="reviewTableDiv">
				<table class="reviewTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="myReview1">
						<td class="myReviewtd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="myReview1td2">책제목</td>
					</tr>
					<tr class="myReview2">
						<!-- <td></td> -->
						<td class="myReview2td2">작가</td>
					</tr>
					<tr class="myReview3">
						<!-- <td></td> -->
						<td class="myReview3td2">　</td>
					</tr>
					<tr class="myReview4">
						<!-- <td></td> -->
						<td class="myReview4td2">2024-01-20</td>
					</tr>
					<tr class="myReview5">
						<!-- <td></td> -->
						<td class="myReview5td2">★★★★</td>
					</tr>
					<tr class="myReview6">
						<!-- <td></td> -->
						<td class="myReview6td2">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
					</tr>
				</table>

				<table class="reviewTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="myReview1">
						<td class="myReviewtd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="myReview1td2">책제목</td>
					</tr>
					<tr class="myReview2">
						<!-- <td></td> -->
						<td class="myReview2td2">작가</td>
					</tr>
					<tr class="myReview3">
						<!-- <td></td> -->
						<td class="myReview3td2">　</td>
					</tr>
					<tr class="myReview4">
						<!-- <td></td> -->
						<td class="myReview4td2">2024-01-20</td>
					</tr>
					<tr class="myReview5">
						<!-- <td></td> -->
						<td class="myReview5td2">★★★★</td>
					</tr>
					<tr class="myReview6">
						<!-- <td></td> -->
						<td class="myReview6td2">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
					</tr>
				</table>

				<table class="reviewTable">
					<!-- 반복문 돌릴 예정 -->
					<tr class="myReview1">
						<td class="myReviewtd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="myReview1td2">책제목</td>
					</tr>
					<tr class="myReview2">
						<!-- <td></td> -->
						<td class="myReview2td2">작가</td>
					</tr>
					<tr class="myReview3">
						<!-- <td></td> -->
						<td class="myReview3td2">　</td>
					</tr>
					<tr class="myReview4">
						<!-- <td></td> -->
						<td class="myReview4td2">2024-01-20</td>
					</tr>
					<tr class="myReview5">
						<!-- <td></td> -->
						<td class="myReview5td2">★★★★</td>
					</tr>
					<tr class="myReview6">
						<!-- <td></td> -->
						<td class="myReview6td2">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
					</tr>
				</table>
			</div>
			<!-- reviewTableDiv -->

		</div>
		<!-- myReview -->

	</div>
	<!-- content -->

	<div class="reviewPage">
		<table class="reviewPageTable">
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