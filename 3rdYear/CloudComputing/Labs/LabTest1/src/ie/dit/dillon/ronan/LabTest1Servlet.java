package ie.dit.dillon.ronan;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LabTest1Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException 
			{
			resp.setContentType("text/plain");
			resp.getWriter().print("Calculate: ");
			String AString;
			String BString;
			String CString;
			String DString;
			int numA,numB,numC,numD;
			AString = req.getParameter("A");
			BString = req.getParameter("B");
			CString = req.getParameter("C");
			DString = req.getParameter("D");
			
			if(AString == null){
				AString = getServletConfig().getInitParameter("A");
	        }
			if(BString == null){
				BString = getServletConfig().getInitParameter("B");
	        }
			if(CString == null){
				CString = getServletConfig().getInitParameter("C");
	        }
			if(BString == null){
				DString = getServletConfig().getInitParameter("D");
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
			try 
			{ 
				Integer.parseInt(CString);
		        
		    } 
			catch(NumberFormatException e) 
		    { 
		    	// get the default A parameter from the Deployment Descriptor
			    CString = getServletConfig().getInitParameter("C");
		    }
			try 
			{ 
				Integer.parseInt(DString);
		        
		    } 
			catch(NumberFormatException e) 
		    { 
		    	// get the default A parameter from the Deployment Descriptor
			    DString = getServletConfig().getInitParameter("D");
		    }
	        
	        numA = Integer.parseInt(AString);
	        numB = Integer.parseInt(BString);
	        numC = Integer.parseInt(CString);
	        numD = Integer.parseInt(DString);
	        
			resp.getWriter().println("("+numA+"-"+numB+")"+"*"+"("+numC+"-"+numD+") ="+(numA-numB)*(numC-numD));
		}
}
