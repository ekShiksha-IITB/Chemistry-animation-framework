/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.LatticeExamplesDAO;

/**
 *
 * @author aishwarya
 */
public class ExampleServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String message="NULL";
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter pw = response.getWriter()) {
            try{
            String ename = request.getParameter("ename");
            String lname=request.getParameter("lname");
            LatticeExamplesDAO examplesDAO=new LatticeExamplesDAO();
            int l_id;
            switch(lname)
            {
                case "Cubic":l_id=1;
                break;
                 case "Tetragonal":l_id=2;
                break;
                 case "Orthorhombic":l_id=3;
                break;
                 case "Hexagonal":l_id=4;
                break;
                 case "Monoclinic":l_id=5;
                break;
                 case "Triclinc":l_id=6;
                break;
                 case "Rhombohedral":l_id=7;
                break;
                 case "Trigonal":l_id=7;
                break;
                 default:l_id=1;
                
            }
            int status=examplesDAO.addExample(ename, lname, l_id);
            
            if(status!=0)
            message="Data is successfully inserted!";
            else{
            message="Failed to insert the data";
            }
            request.setAttribute("message",message);
        request.getRequestDispatcher("index.jsp?option=4").forward(request, response);
                }
            catch (Exception e){
                response.sendRedirect("index.jsp?option=4");
            System.out.println(e);
            }
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
    

