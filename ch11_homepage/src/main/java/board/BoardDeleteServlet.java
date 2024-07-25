package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Board deBoard = new Board();
		deBoard.setPass(request.getParameter("pass"));
		deBoard.setNum(Integer.parseInt(request.getParameter("num")));
		String nowPage = request.getParameter("nowPage");
		
		HttpSession session =request.getSession();
		Board deBean =(Board)session.getAttribute("bean");
		
		if(deBean.getPass().equals(deBoard.getPass())) {
			if(new BoardDao().deleteBoard(deBoard)) {
				new BoardDao().deleteBoard(deBoard);
				out.println("<script>");
				out.println("alert('삭제되었습니다.')");
				out.println("location.href='list.jsp?"+ nowPage +"' ");
				out.println("</script>");
			}else {	
				out.println("<script>");
				out.println("alert('댓글이 있으므로 삭제할 수 없습니다')");
				out.println("history.go(-2) ");
				out.println("</script>");
			}
		}else{
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다')");
			out.println("history.back();");
			out.println("</script>");
		}
	
	}
}
