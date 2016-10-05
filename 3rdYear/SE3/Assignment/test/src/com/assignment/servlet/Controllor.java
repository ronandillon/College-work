package com.assignment.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.assignment.dao.Dao;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


/**
 * Servlet implementation class FrontController
 */
@WebServlet(urlPatterns={"/Controllor"})
public class Controllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Enter_ACTION = "EnterMeal";
	Connection con =null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controllor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest (request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	
	/**
	 * Common method to process all client requests (GET and POST)
	 * @throws SQLException 
	 */
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String forwardToJsp = null;		
		String action = request.getParameter("action");
		
		
		/*
		 * NOTE: AS A SPCIAL CASE, THIS SECTION OF THE CODE DEALS WITH CHECKING LOGIN DETAILS...
		 */
		
		//Check if this is not a login request...
		

			//If not a login request then need to check that user is  
			//logged in before processing ANY requests.
			
			//Check to see if the session id coming from the client matches the id stored at login...
			HttpSession session = request.getSession();

			//If user not logged in...
			if (request.getParameter("calories") != null ){
				
				
					String type =request.getParameter("type");
					int calories=Integer.parseInt(request.getParameter("calories"));
					Dao dao = new Dao();
					dao.addMeal(type,calories);
					
				
				forwardToJsp = "/entered.jsp";
				forwardToPage(request, response, forwardToJsp);
				return;
			}		
			else
			{
				forwardToJsp = "/loginFailure.jsp";
				forwardToPage(request, response, forwardToJsp);
				return;
			}
					
		
		
		//Now we can process whatever the request is...
		//We just create a Command object to handle the request...
		
		
	}
	
	
	/**
	 * Forward to server to the supplied page
	 */
	private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page){
		
		//Get the request dispatcher object and forward the request to the appropriate JSP page...
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}