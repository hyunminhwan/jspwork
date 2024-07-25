package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class BoardUpdateServlet
 */
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Board upBoard = new Board();
		upBoard.setNum(Integer.parseInt(request.getParameter("num")));
		upBoard.setName(request.getParameter("name"));
		upBoard.setSubject(request.getParameter("subject"));
		upBoard.setContent(request.getParameter("content"));
		upBoard.setPass(request.getParameter("pass"));
		String nowPage = request.getParameter("nowPage"); //read.jsp에서 사용자가 넣은 pass
	
		HttpSession session =request.getSession();
		Board inBean =(Board)session.getAttribute("bean"); //DB에 저장되어있는 pass
		
		if(inBean.getPass().equals(upBoard.getPass())) {
			new BoardDao().updateBoard(upBoard);
			String url ="read.jsp?nowPage="+nowPage+"&num="+upBoard.getNum();
			response.sendRedirect(url);
		}else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지 않습니다')");
			out.print("history.back();");
			out.print("</script>");
		}
	
	}
	

}
