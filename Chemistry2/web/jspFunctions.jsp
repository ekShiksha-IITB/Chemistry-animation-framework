<%-- 
    Document   : jspFunctions
    Created on : 13 Jun, 2017, 10:32:49 AM
    Author     : abhi
--%>
    <%!
        String sidebar="sidebars/generic.jsp";
       static int subtopicId=-1;
       int setSubtopicId(int id)
        {
           System.out.println( "Setting ID" ); 
            subtopicId=id;
            return 1;
        }
        String getSidebar()
        {
        System.out.println( "Fetching content" ); 
         if(subtopicId==1)
             sidebar="sidebars/atom.jsp";
        else if(subtopicId==3)
            sidebar="sidebars/sidebar.jsp";
        else if(subtopicId==4)
            sidebar="sidebars/sidebar2.jsp";
        else
            sidebar="sidebars/generic.jsp";
         return sidebar;
        }
        
    %>
