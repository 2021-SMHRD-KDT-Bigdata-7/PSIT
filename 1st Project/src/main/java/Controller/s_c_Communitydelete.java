package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;

@WebServlet("/s_c_Communitydelete")
public class s_c_Communitydelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num =0;
		if(request.getParameter("num") != null) {
			num=Integer.parseInt(request.getParameter("num"));
		}
		DAO dao=new DAO();
		if (num == 0) {
			System.out.println("���ΰԽ�����������");
		}else {
			System.out.println("���ΰԽ��� ���� ����");
			System.out.println(num);
		}
		int lognum = dao.s_communitydelete(num);
		 if (lognum>0){
			 System.out.println("S_����");
	         response.sendRedirect("c_Study_Community.jsp");
		}else{
			System.out.println("��������");
			response.sendRedirect("c_Study_Community.jsp");
		} 
   }
	
}