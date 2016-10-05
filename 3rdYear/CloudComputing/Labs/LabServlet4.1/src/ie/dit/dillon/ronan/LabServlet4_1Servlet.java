package ie.dit.dillon.ronan;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class LabServlet4_1Servlet extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		displayTextFile(req,resp);
	}
	
	
	public int displayTextFile(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		BufferedReader input = null;
		String TextFile = "sample.txt";
		input = new BufferedReader(new FileReader(TextFile));
		String line;
		while (( line = input.readLine()) != null) 
		resp.getWriter().println("\t"+line);
		input.close();
		return 0;   
	}
}
