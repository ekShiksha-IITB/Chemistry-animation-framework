/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ConnectionUtil.ConnectionFactory;
import DAO.OrganicCompoundDAO;
/**
 *
 * @author aishwarya
 */
public class OrganicCompoundServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message="NULL";
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter pw = response.getWriter()) {
            try{
            String name = request.getParameter("name");
            int carbons = Integer.parseInt(request.getParameter("carbons"));
            int hydrogen = Integer.parseInt(request.getParameter("hydrogen"));
            int type = Integer.parseInt(request.getParameter("type"));
            int bond1 = Integer.parseInt(request.getParameter("bond1"));
            int bond2 = Integer.parseInt(request.getParameter("bond2"));
            OrganicCompoundDAO organiccompoundDAO=new OrganicCompoundDAO();
            
            int status=organiccompoundDAO.addCompound(name, carbons, hydrogen , type , bond1 , bond2);
            
            if(status!=0)
            message="Data is successfully inserted!";
            else{
            message="Failed to insert the data";
            }
            request.setAttribute("message",message);
        request.getRequestDispatcher("index.jsp?option=9").forward(request, response);
                }
            catch (Exception e){
                response.sendRedirect("index.jsp?option=9");
            pw.println(e);
            }
          }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}