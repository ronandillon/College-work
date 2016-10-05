package ie.dit.dillon.ronan;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
/**
 * 
 * @author User
 *
 */
public class Delete extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/plain");
		Query myQuery = new Query("myEntity");
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		PreparedQuery pq = datastore.prepare(myQuery);
		BlobKey blobkey = new BlobKey(request.getParameter("blob-key"));
		
		//This for goes through all of the entities in the datastore 
        for (Entity result : pq.asIterable()) {
        	//when one of the entities is equal to the entity to be deleted it enters this if and gets removed
			if(blobkey.equals(result.getProperty("Blobkey")))
			{
				datastore.delete(result.getKey());
				response.sendRedirect("/list");
			}
		}
	}

}
