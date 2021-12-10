package Controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




import Model.DAO;
@WebServlet("/s_c_Communitywrite")
public class s_c_Communitywrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  
	System.out.println(request.getServletContext().getRealPath("images"));
		/* * File file = new File("images"); //�����(class���ϰ� ������ ����) if(file.exists()) {
		 * System.out.println("getPath : "+file.getPath());//�����
		 * System.out.println("getAbsolutePath : "+file.getAbsolutePath());//������ }else
		 * { file.mkdir(); System.out.println("�ش� ���� ����."); }
		 */
		HttpSession session = request.getSession();
		String userID = "doflsld";
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		String savePath = request.getServletContext().getRealPath("images");
		int maxSize =5*1024*1024;
		String encoding = "euc-kr";
		MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,encoding,new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		String language = multi.getParameter("language");
		System.out.println(language);
		String writer= userID;
		String content = multi.getParameter("content");
		String filename1 = "none.png";
		try {
			filename1 = URLEncoder.encode(multi.getFilesystemName("file1"), "euc-kr");
		} catch (Exception e) {
		}
		DAO dao=new DAO();
		int lognum=dao.s_community_write(title,language,writer,content,filename1);
		if (lognum>0) {
			System.out.println("���ΰԽñ� �ۼ� ����!");
			response.sendRedirect("c_Study_Community.jsp");
		}else {
			System.out.println("���ΰԽñ� �ۼ� ����!");
			response.sendRedirect("c_Study_Community.jsp");
		}
		
	}

}