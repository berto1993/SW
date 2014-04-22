package clases;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogIn
 */
@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String  nombre= request.getParameter("name");
			String contra = request.getParameter("password");	
	
			if(consultas.comprobarUsuarioCon(nombre, contra)!= null)
			{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				try 
				{
					out.println("<html>");
					out.println("<head>");
					out.println("<title>DoGetDoPost--POST</title>");
					out.println("</head>");
					out.println("<body>");
					out.println("<h1>!Fijate! NO hay parámetros en URI</h1>");
					
					out.println("<b>Parametro: ");
					out.println("<b>Valor: ");
					
					out.println("<a	href=/DoGetDoPost/DoGetDoPost.html>"+ "Volver a la página anterior</a><br/>");
					out.println("</body>");
					out.println("</html>");
				} finally 
				{
					out.close();
				}
			}
					
	}

}
