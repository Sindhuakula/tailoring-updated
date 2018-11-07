<%-- 
    Document   : order1
    Created on : Nov 2, 2018, 6:22:31 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
              
             String a=request.getParameter("model");
             String b=request.getParameter("size");
             String name=(String)session.getAttribute("uname");
             String id=(String)session.getAttribute("uid");
            //out.print("Hello "+name);
             
             Class.forName("com.mysql.jdbc.Driver");
           // out.println("record inserted successfully 2");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tailor","root","");
           
             
            
                 String q="call insert_order(?,?,?)";
             PreparedStatement ps=con.prepareStatement(q);
                           ps.setString(1,id);
                            ps.setString(2,a);
                            ps.setString(3,b);
                       
                            
                            
                                     int i=ps.executeUpdate();
                                     if(i>0)
                                     {
                                         response.sendRedirect(request.getContextPath() + "/makeorder.jsp");
                                     }
                                     else{
                                       out.println("record not updated");
                                     }
            
                                         
                                                          %>

                                                          <a href="makeorder.jsp"><span>Retry</span></a>
        
    </body>
</html>

