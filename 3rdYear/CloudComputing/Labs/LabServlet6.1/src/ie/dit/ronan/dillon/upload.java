package ie.dit.ronan.dillon;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.BlobstoreServicePb.BlobstoreService;

	
	public class upload extends HttpServlet {
		/**
		* 
		*/
		private static final long serialVersionUID = 1L;
		private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		public void doPost(HttpServletRequest req, HttpServletResponse res)
		 throws ServletException, IOException {
		 @SuppressWarnings("deprecation")
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		 BlobKey blobKey = blobs.get("myFile");
		 if (blobKey == null) {
		 res.sendRedirect("/");
		 } else {
		 System.out.println("Uploaded a file with blobKey: "+blobKey.getKeyString());
		 res.sendRedirect("/serve?blob-key=" + blobKey.getKeyString());
		 }
		}
}


