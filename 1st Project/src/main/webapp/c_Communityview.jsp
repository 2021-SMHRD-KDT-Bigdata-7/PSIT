<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Model.CommunityVO"%>
<%@page import="Model.DAO"%>
<%@ page import="Model.Community_commentVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<title>PSIT.com - Free_Community</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-grad-school.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<style>
table {
	height: 100%;
}
</style>
</head>
<body>
	<%	
MemberVO vo =null;
String userID= null;
if (session.getAttribute("vo") != null){
	vo = (MemberVO)session.getAttribute("vo");
	userID = vo.getM_id();
	System.out.print(userID);
}else{%>
	Response.Write("
	<script>alert('로그인 후 이용하실 수 있는 서비스 입니다.');</script>
	"); Response.Write("
	<script>location.href='Main.jsp';</script>
	");
	<%}%>
	<% 
DAO dao = new DAO();
CommunityVO cvo = (CommunityVO)session.getAttribute("cvo");
ArrayList<Community_commentVO> cm_arr = dao.cm_Community(cvo.getC_seq());
if (session.getAttribute("vo") != null){
	vo = (MemberVO)session.getAttribute("vo");
}
ArrayList<CommunityVO> arr = dao.Community();
Community_commentVO cmvo = (Community_commentVO)session.getAttribute("cmvo");
%>

	<header class="main-header clearfix" role="header">
		<div class="logo">
			<a href="Main.jsp"><em>PSIT</em> <span
				style="font-size: x-large;">Personal IT</span></a>
		</div>
		<a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
		<nav id="menu" class="main-nav" role="navigation">
			<ul class="main-menu">
				<li><a href="Main.jsp">Home</a></li>
				<% if(vo!=null){%>
				<li><a href="#">직무탐색</a>
					<ul class="sub-menu">
						<li><a href="P_Psit.jsp">PSIT 검사</a></li>
						<li><a href="P_Psit_Result.jsp">My PSIT</a></li>
					</ul></li>
				<li><a href="StudyPage.jsp">단계별학습</a></li>
				<li><a class="external">커뮤니티</a>
					<ul class="sub-menu">
						<li><a href="c_Community.jsp">자유게시판</a></li>
						<li><a href="c_Study_Community.jsp">스터디 게시판</a></li>
						<li><a href="c_Used_Community.jsp">중고거래 게시판</a></li>
					</ul></li>
				<%if(vo.getM_id().equals("admin")) { %>
				<li><a href="ManageUser.jsp" class="external">회원관리</a></li>
				<%}else{ %>
				<li><a href="My_page.jsp" class="external">마이페이지</a></li>
				<%} %>
				<li><a href="LogoutService" class="external">로그아웃</a></li>
				<%} else {%>
				<li><a href="Login.jsp">Login</a></li>
				<li><a href="Join.jsp">Join</a></li>
				<%} %>
			</ul>
		</nav>
	</header>
	<section style="color: white; text-align: center;"
		class="section coming-soon" data-section="section3">
		<div class="col-8  col-12-narrower imp-narrower"
			style="max-width: 90% !important; display: inline-block;">
			<div id="content">
				<article>
					<div id="board" style="background-color: rgba(250, 250, 250, 0.2);">
						<div align="left" style="padding: 10px;">
							<a href="c_Community.jsp"><button
									style="background-color: #f5a425; width: 10%; height: 40px; color: white; border: none;">뒤로가기</button></a>
							<h2 align="center" style="padding: 1%">
								자유게시판 -
								<%=cvo.getTitle()%></h2>
							<div style="text-align: center;">
								<table id="list"
									style="margin: 1%; display: inline-table; width: 80%; height: 600px ; text-align: center;">
									<tr style="height: 40px">
										<td style="text-align: center"><br>작성자</td>
										<td><br><h6><%=cvo.getWriter()%></h6></td>
									</tr>
									<tr style="height: 40px">
										<td style="text-align: center">제목</td>
										<td><h6><%=cvo.getTitle()%></h6></td>
									</tr>
									<tr class="a" class="cm_tr" style="height: 50%">
										<td style="text-align: center">내용</td>
										<td><h6><%=cvo.getContent()%></h6></td>
									</tr>

									<tr style="height: 30%">
									<td></td>
									<%
									if (cvo.getFile1().equals("none.png") && cvo.getFile2().equals("none.png") && cvo.getFile3().equals("none.png")) {
									%>
										<td><p style="font-size">첨부된 이미지가 없습니다.</p></td>
									<%
									} else if (cvo.getFile1() != null && cvo.getFile2().equals("none.png") && cvo.getFile3().equals("none.png")) {
									%>
										<td><img src="./images/<%=cvo.getFile1()%>"></td>
									<%
									} else if (cvo.getFile1().equals("none.png") && cvo.getFile2() != null && cvo.getFile3().equals("none.png")){
									%>
										<td><img src="./images/<%=cvo.getFile2()%>"></td>
									<%
									} else if (cvo.getFile1().equals("none.png") && cvo.getFile2().equals("none.png") && cvo.getFile3() == null){%>
										<td><img src="./images/<%=cvo.getFile3()%>"></td>									
									<%
									}else if (cvo.getFile1() != null && cvo.getFile2() != null && cvo.getFile3().equals("none.png")){%>
										<td><img src="./images/<%=cvo.getFile1()%>"><img src="./images/<%=cvo.getFile2()%>"></td>								
									<%
									}else if (cvo.getFile1() != null && cvo.getFile2().equals("none.png") && cvo.getFile3() != null){%>
										<td><img src="./images/<%=cvo.getFile1()%>"><img src="./images/<%=cvo.getFile3()%>"></td>								
									<%
									}else if (cvo.getFile1().equals("none.png") && cvo.getFile2() != null && cvo.getFile3() != null){%>
										<td><img src="./images/<%=cvo.getFile2()%>"><img src="./images/<%=cvo.getFile3()%>"></td>								
									<%
									}else if (cvo.getFile1() != null && cvo.getFile2() != null && cvo.getFile3() != null){%>
										<td><img src="./images/<%=cvo.getFile1()%>"><img src="./images/<%=cvo.getFile2()%>"><img src="./images/<%=cvo.getFile3()%>"></td>								
									<%}%>
									</tr>										
								</table>
							</div>
							<%
							if (vo != null) {
							%>
							<%
							if (userID.equals(cvo.getWriter()) || userID.equals("admin") || userID.equals("skalswn")) {
							%>
							<div style="text-align: center;">
							<div align="right" style="width: 80%; display:inline-block; margin-bottom: 40px;">
								<span style="width: 100px; height: 30px;"> <a
									href="c_Communitychange.jsp?num=<%=cvo.getC_seq()%>">
										<button style="background-color: #f5a425; color: white; border: none;">수정</button>
								</a>
								</span> <span style="width: 100px; height: 30px;"> <a
									href="c_Communitydelete?num=<%=cvo.getC_seq()%>">
										<button style="background-color: #f5a425; color: white; border: none;">삭제</button>
								</a>
								</span>
							</div>
							</div>
							<%
							}
							%>
							<%
							}
							%>
							<form action="c_Comment" style="padding: 1%">
								<table style="width: 80%; text-align: center;">
									<tr style="display: inline-block;">
										<td rows="1" cols="100"><input type="text"
											name="C_comment" id="C_comment"></td>
										<td rows="1" cols="20"><input type="submit" value="댓글 작성"></td>
									</tr>

									<tr>
										<td><input value="<%=cvo.getC_seq()%>" name="num"
											style="display: none"> <%
 if (cm_arr != null) {
 %> <%
 for (int i = 0; i < cm_arr.size(); i++) {
 %> <span><%=cm_arr.get(i).getC_writer()%> : </span> <span><%=cm_arr.get(i).getContent()%></span>
											<%
											if (vo != null) {
											%> <%
 if (userID.equals(cvo.getWriter()) || userID.equals("admin") || userID.equals("skalswn")) {
 %> <span align="left"> <a
												href="c_Commentdelete?num=<%=cm_arr.get(i).getCm_seq()%>">
													<button
														style="background-color: #f5a425; width: 70px; height: 20px; color: white;">삭제하기</button>
											</a>
										</span> <%
 }}
 %> <span> <%
 if (cm_arr.get(i).getC_writer().equals(vo.getM_id())) {
 %>
										</span> <%
 }
 %></td>
									</tr>
									<%
									}}
									%>
								</table>
							</form>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
	<div>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p>
						<i class="fa fa-copyright"></i> Copyright 2020 by Grad School |
						Design: <a href="https://templatemo.com" rel="sponsored"
							target="_parent">TemplateMo</a><br> Distributed By: <a
							href="https://themewagon.com" rel="sponsored" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	</div>
	
</body>
</html>