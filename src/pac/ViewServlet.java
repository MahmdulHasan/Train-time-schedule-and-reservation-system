package pac;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewServlet extends HttpServlet {

	 public void doPost(HttpServletRequest request, 
                         HttpServletResponse response)
	 throws ServletException, IOException {
		
		 String pName= (String)request.getParameter("pname");
		 String mobileNo=(String)request.getParameter("mobileno");
		 String passengerNo=(String)request.getParameter("passengerno");
		 String trainName= (String) request.getParameter("trainname");
		 

		 
			
			

			
			request.setAttribute("pname",pName);
			request.setAttribute("mobileno",mobileNo);
			request.setAttribute("passengerno",passengerNo);
			request.setAttribute("trainname",trainName);
			
		


		 
		
		     request.getRequestDispatcher("confirm.jsp").
                forward(request, response);
		 
	}

}


