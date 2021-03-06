package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;

/**
 * Servlet implementation class s_c_Commentdelete
 */
@WebServlet("/s_c_Commentdelete")
public class s_c_Commentdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num =0;
		if(request.getParameter("num") != null) {
			num=Integer.parseInt(request.getParameter("num"));
		}
		DAO dao=new DAO();
		if (num == 0) {
			System.out.println("게시판 댓글 접근차단");
		}else {
			System.out.println("게시판 댓글  접근 성공");
			System.out.println(num);
		}
		int lognum = dao.s_c_Commentdelete(num);
		 if (lognum>0){
			 System.out.println("S_삭제");
	         response.sendRedirect("c_Study_Communityview.jsp");
		}else{
			System.out.println("삭제실패");
			response.sendRedirect("c_Study_Community.jsp");
		} 
   }
	
}