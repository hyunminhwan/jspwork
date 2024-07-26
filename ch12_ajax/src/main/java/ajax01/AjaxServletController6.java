package ajax01;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxServletController6
 */
public class AjaxServletController6 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<memBean> alist =new MemberMgr().getAllMember();
		
		//1. JSONArray[{},{},{}]
//		JSONArray jArr = new JSONArray();
//		for(memBean m : alist) {
//			JSONObject jobj = new JSONObject();
//			jobj.put("id", m.getId());
//			jobj.put("name", m.getName());
//			jobj.put("gender", m.getGender());
//			jobj.put("email", m.getEmail());
//			
//			jArr.add(jobj);
//		}
//			response.setContentType("application/json; charset=utf-8");
//			 response.getWriter().print(jArr);
		
		//2. GSON
		response.setContentType("application/json; charset=utf-8"); 
		new Gson().toJson(alist, response.getWriter());//한줄로;
	}

}