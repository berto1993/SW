
package clases;

// Import required java libraries
import java.io.*;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 



import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadServlet extends HttpServlet {
   
   /**
*
*/
private static final long serialVersionUID = 1L;
private boolean isMultipart;
   private String filePath;
   private int maxFileSize = 50 * 1024;
   private int maxMemSize = 4 * 1024;
   private File file ;

   public void init( ){
      // Get the file location where it would be stored.
      filePath =
             getServletContext().getInitParameter("file-upload");
   }	
   public void doPost(HttpServletRequest request,
               HttpServletResponse response)
              throws ServletException, java.io.IOException {
      // Check that we have a file upload request
      isMultipart = ServletFileUpload.isMultipartContent(request);
      response.setContentType("text/html");
      java.io.PrintWriter out = response.getWriter( );
      if( !isMultipart ){
               return;
      }
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );

      try{
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();
      String nombre = null;
String email = null ;
String coment = null ;
     
      while ( i.hasNext () )
      {
         FileItem fi = (FileItem)i.next();
         out.println(fi.getFieldName()+": "+fi.getString()+"<br>");
         if(fi.getFieldName().equals("name"))
         nombre = fi.getString();
         if(fi.getFieldName().equals("email"))
         email = fi.getString();
         if(fi.getFieldName().equals("comments"))
         coment = fi.getString();
         if ( !fi.isFormField () )	
         {
        
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            String contentType = fi.getContentType();
            out.println(fileName);
            if (fieldName.equals("name"))
            {
             nombre = fi.getString();
            }
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
               file = new File( filePath +
               fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
               file = new File( filePath +
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
         
     try {
     consultas.insertarContacto(nombre, email, fileName, coment);
                } catch (SQLException e1) {
     // TODO Auto-generated catch block
     e1.printStackTrace();
     }
         }
      }
    
   }catch(Exception ex) {
      System.out.println(ex);
   }
      response.sendRedirect("index.jsp");
   }
}