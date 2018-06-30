package pac;

import pac.classes.SetGetClass;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		   
		String source= request.getParameter("source");
		String destination= request.getParameter("destination");
		String day= request.getParameter("day");
		String tClass= request.getParameter("tclass");
		
		System.out.println(source+" "+destination+" "+day+" "+tClass);
		request.setAttribute("source",source);
		request.setAttribute("destination",destination);
		request.setAttribute("day",day);
		request.setAttribute("tclass", tClass);
		request.getRequestDispatcher("view.jsp").forward(request, response);
		
		
		
		  
	}

	   
	  	

}

