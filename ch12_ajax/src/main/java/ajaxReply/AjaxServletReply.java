package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxServletReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reply re = new Reply();
		String reply = request.getParameter("reply");
		String name = request.getParameter("name");
		re.setName(name);
		re.setContent(reply);
		boolean result=new ReplyDao().insert(re);
		
		if(result) {
			response.getWriter().print("y");
		}else {
			response.getWriter().print("n");
		}
	}

}
