package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
@WebServlet("/u_c_Comment")
public class u_c_Communitydelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num =0;
		if(request.getParameter("num") != null) {
			num=Integer.parseInt(request.getParameter("num"));
		}
		DAO dao=new DAO();
		if (num == 0) {
			System.out.println("공부게시판접근차단");
		}else {
			System.out.println("공부게시판 접근 성공");
			System.out.println(num);
		}
		int lognum = dao.s_communitydelete(num);
		 if (lognum>0){
			 System.out.println("S_삭제");
	         response.sendRedirect("c_Study_Community.jsp");
		}else{
			System.out.println("삭제실패");
			response.sendRedirect("c_Study_Community.jsp");
		} 
   }
	
}