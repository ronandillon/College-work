package ie.dit.ronan.dillon;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
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
		
		if(AString == null && BString == null){
        	numA = 0;
        	numB = 0;
        }
        else{
        	numA = Integer.parseInt(AString);
            numB = Integer.parseInt(BString);
        }
		
		resp.getWriter().println((numA*numB));
	}
}

