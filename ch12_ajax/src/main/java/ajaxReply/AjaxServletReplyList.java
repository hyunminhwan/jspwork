package ajaxReply;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bum =Integer.parseInt(request.getParameter("bnum"));
		ArrayList<Reply> alist =new ArrayList<Reply>();
		alist=new ReplyDao().getReplyList(bum);
		
		
		response.setContentType("application/json; charset=utf-8"); 
		new Gson().toJson(alist, response.getWriter());//한줄로;
		
		
		

		
	}
}
