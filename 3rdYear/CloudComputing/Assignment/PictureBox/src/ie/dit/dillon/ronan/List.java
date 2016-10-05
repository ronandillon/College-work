package ie.dit.dillon.ronan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
/**
 * 
 * @author User
 *
 */
public class List extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
		
		
		response.setContentType("text/html");
		response.getWriter().println("<head><style> #header { background-color:black; color:white;  text-align:center; padding:5px;}  </style>  </head> <div id="+"header"+"> <h1>Picture Box</h1> </div>");
		Query myQuery = new Query("myEntity");
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		PreparedQuery pq = datastore.prepare(myQuery);
		response.getWriter().println("<center><ul>");
		User user=null;
		boolean exception=false;
		
		UserService userservice = UserServiceFactory.getUserService();
    	user = userservice.getCurrentUser();
		
		
		for (Entity result : pq.asIterable()) {
			try
			{	//if Mark Deegan or myself are logged in the admin case will be used
				if(user.toString().equals("dillonronan94@gmail.com")||user.toString().equals("mark.deegan@dit.ie"))
				{
				String FileName = (String) result.getProperty("Title");
				String User = (String) result.getProperty("User");
				String Type = (String) result.getProperty("Type");
				BlobKey blobKey = (BlobKey) result.getProperty("Blobkey");
				response.getWriter().print("<li>"+FileName + " " + User + " " + Type);
				response.getWriter().print("<a href='/serve?blob-key="+blobKey.getKeyString()+"'>View Image</a>  ");
				response.getWriter().print("  <a href='/delete?blob-key="+blobKey.getKeyString()+"'>Delete Image</a></li>");
				}
				else //this is used for a user who is signed in but not an admin
				{
					String FileName = (String) result.getProperty("Title");
					String User = (String) result.getProperty("User");
					String Type = (String) result.getProperty("Type");
					BlobKey blobKey = (BlobKey) result.getProperty("Blobkey");
					response.getWriter().print("<li>"+FileName + " " + User + " " + Type);
					response.getWriter().print("<a href='/serve?blob-key="+blobKey.getKeyString()+"'>View Image</a>  ");
					if(user.toString().equals(result.getProperty("User")))
					{
						response.getWriter().print("  <a href='/delete?blob-key="+blobKey.getKeyString()+"'>Delete Image</a></li>");
					}
					
				}
			}
			catch(Exception e)
			{//catch for users who arent signed in
				if(result.getProperty("Type").equals("public"))
				{
					String FileName = (String) result.getProperty("Title");
					String User = (String) result.getProperty("User");
					String Type = (String) result.getProperty("Type");
					BlobKey blobKey = (BlobKey) result.getProperty("Blobkey");
					response.getWriter().print("<li>"+FileName + " " + User + " " + Type);
					response.getWriter().print("<a href='/serve?blob-key="+blobKey.getKeyString()+"'>View Image</a>  ");
				}
			}
		}
		response.getWriter().println("</ul><center>");

   	 response.getWriter().println("<a href='/index.html'>Return To Main Menu</a>");
	}
	
}
