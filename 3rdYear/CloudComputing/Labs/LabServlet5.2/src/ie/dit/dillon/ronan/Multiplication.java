package ie.dit.dillon.ronan;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Multiplication extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Multiplication");
		String AString;
		String BString;
		int numA,numB;
		AString = req.getParameter("A");
		BString = req.getParameter("B");
		
		if(AString == null){
			AString = getServletConfig().getInitParameter("A");
        }
		if(BString == null){
			BString = getServletConfig().getInitParameter("B");
        }
		
		try 
		{ 
			Integer.parseInt(AString);
	        
	    } 
		catch(NumberFormatException e) 
	    { 
	    	// get the default A parameter from the Deployment Descriptor
		    AString = getServletConfig().getInitParameter("A");
	    }
		try 
		{ 
			Integer.parseInt(BString);
	        
	    } 
		catch(NumberFormatException e) 
	    { 
	    	// get the default A parameter from the Deployment Descriptor
		    BString = getServletConfig().getInitParameter("B");
	    }
        
        numA = Integer.parseInt(AString);
        numB = Integer.parseInt(BString);
        	
		resp.getWriter().println((numA*numB));
	}
}
