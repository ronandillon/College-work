package ie.dit.dillon.ronan;

import java.io.IOException;
import java.security.Principal;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.ant.taskdefs.email.EmailAddress;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
/**
 * 
 * @author User
 *
 */
public class Upload extends HttpServlet{
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	
	
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	Principal myPrincipal = request.getUserPrincipal();
    	//If the user isn't logged in they are sent to the login
    	if(myPrincipal == null)
    	{
    		response.sendRedirect("/picturebox");
    	}
    	response.setContentType("text/html");
    	response.getWriter().println("<head><style> #header { background-color:black; color:white;  text-align:center; padding:5px;}  </style>  </head> <div id="+"header"+"> <h1>Picture Box</h1> </div>");
		
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(request);
        BlobKey blobKey = blobs.get("myFile");
        //Checks to see if the blob is empty
        if (blobKey == null) {
            response.sendRedirect("/");
        } else {
        	Entity image=new Entity("myEntity");
        	BlobInfoFactory blobInfoFactory= new BlobInfoFactory();
        	BlobInfo blobInfo = blobInfoFactory.loadBlobInfo(blobKey);
        	String fileName=blobInfo.getFilename();
        	String type=null;
        	UserService userservice = UserServiceFactory.getUserService();
        	User user = userservice.getCurrentUser();
        	//Used to make images public or private depending on what type of user uploaded them
        	if(user.toString().equals("dillonronan94@gmail.com")||user.toString().equals("mark.deegan@dit.ie"))
        	{
        		type="private";
        	}
        	else
        	{
        		type="public";
        	}
        	//Used to store details into the datastore for use in the list.java
        	
        	image.setProperty("User", PictureBoxServlet.emailAddress);
        	image.setProperty("Blobkey",blobKey);
        	image.setProperty("Title", fileName);
        	image.setProperty("Type", type);
        	datastore.put(image);
    		response.getWriter().println("<h1>You have uploaded an image to PictureBox</h1>");
        	response.getWriter().println("<a href='/index.html'>Return To Main Menu</a>");
         	}
    }

}
