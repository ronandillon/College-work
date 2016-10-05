package ie.dit.dillon.ronan;
import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
/**
 * 
 * @author User
 *
 */
public class PictureBoxServlet extends HttpServlet {
	
	public static String emailAddress = null;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/plain");
		UserService userService = UserServiceFactory.getUserService();
		
		//Used for login ID
		
		response.getWriter().println("<head><style> #header { background-color:black; color:white;  text-align:center; padding:5px;}  </style>  </head> <div id="+"header"+"> <h1>Picture Box</h1> </div>");
		Principal myPrincipal = request.getUserPrincipal();
		String this_URL = request.getRequestURI();
		String login_URL = userService.createLoginURL(this_URL);
		String logout_URL = userService.createLogoutURL(this_URL);
		response.setContentType("text/html");
		// Checks if the user is signed in or not
		if(myPrincipal == null) {
			
			response.getWriter().println("<p>You are Not Logged In<br> To upload pictures and view private pictures you must be signed in. </p>");
			response.getWriter().println("<p>You can <a href=\""+login_URL+"\">sign in here</a>.</p>");
			response.getWriter().println("<a href='/index.html'>Return To Main Menu</a>");
		} // end if not logged in
		if(myPrincipal !=null) {
		emailAddress = myPrincipal.getName();
		
		request.setAttribute("logoutURL",logout_URL);
		response.getWriter().println("<p>You can <a href=\"" + logout_URL +"\">sign out</a>.</p>");
		response.getWriter().println("<a href='/index.html'>Return To Main Menu</a>");
		} // end if logged in
		
	}
}
