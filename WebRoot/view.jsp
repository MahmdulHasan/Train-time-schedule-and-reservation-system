<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
   <title>Search result</title>
   <style>
       table {
            border-collapse: collapse;
            width: 50%;
            margin:50px 320px;
      }
      th, td {
         text-align: left;
         padding: 8px;
         border: 1px solid #ddd;
      }
      tr:nth-child(even){background-color: #f2f2f2}
      tr:nth-child(odd){background-color: #f1f1f1}
      tr:hover {background-color: #ddd;}
      th {
         background-color: #4CAF50;
         color: white;
      }
    h1 {
            color: #CEF0D4; 
            font-family: 'Rouge Script', cursive; 
            font-size: 50px; 
            font-weight: normal; 
            line-height: 48px; 
            margin: 20px 0 50px; 
            text-align: center; 
            text-shadow: 1px 1px 2px #082b34; 
          }

   body, html {
      height: 100%;
      margin:0; 
    }

 body {
    /* The image used */
    background-image: url("ict.jpg");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
  
  
       
           
       
    </style>
</head>
 <body>
   <%    
          String source= (String)request.getAttribute("source");
          String destination= (String)request.getAttribute("destination");
          String day= (String)request.getAttribute("day");
          String tClass= (String)request.getAttribute("tclass");
          
          System.out.print(tClass);
    %>     
    <h1>
         Search result for <%=source %> to <%=destination %> on <%=day %>.
     </h1>
    
    
   <div>
    <form action="reservation.jsp" method="post">
    <% 
        session.setAttribute("source",source);
        session.setAttribute("destination",destination);
        session.setAttribute("day",day);  
        session.setAttribute("tclass",tClass);
	    String value="0"; 
     %>
         
 
<%
          
    
      try {   
  	
            String connectionURL = "jdbc:mysql://localhost:3306/test";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            PreparedStatement ps;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root","12345");
            statement = connection.createStatement();
  
       
           String sql = "SELECT trainno,trainname,source,departure,destination,arrival,Fare,Offday,seat from timeschedule where date=? and source=? and destination=? and class=?";
           ps= connection.prepareStatement(sql);
           ps.setString(1,day);
           ps.setString(2,source);
           ps.setString(3,destination);
           ps.setString(4,tClass);
           rs = ps.executeQuery();
%>





<table>
     
    <th>Train No</th>
    <th>Train Name</th>
    <th>Source</th>
    <th>Departure</th>
    <th>Destination</th>
    <th>Arrival</th>
    <th>Fare</th>
    <th>Off Day</th>
    <th>Reservation</th>
    <%
    while (rs.next()) {
    %>
        <TR>
             <TD><%=rs.getString(1)%></TD>   
             <TD><%=rs.getString(2)%></TD> 
             <TD><%=rs.getString(3)%></TD>
             <TD><%=rs.getString(4)%></TD>
             <TD><%=rs.getString(5)%></TD>
             <TD><%=rs.getString(6)%></TD>
             <td><%=rs.getString(7) %></td>
             <td><%=rs.getString(8) %></td>
             <%if(!value.equals( rs.getString(9))){ %>
                <td><input type="submit" value="reserve" style="height:24px;"/></td> 
             <%}%>
             <%if(value.equals(rs.getString(9))){ %>
                <td>no reservation</td>
             <%} %>
                    
        </TR>
    <%   }    %>
     
   
    <%
  
    rs.close();
    statement.close();
    connection.close();
} 
   catch (Exception ex) {
    %>
  
   
    <%
         out.println(ex);
       }
    %>
  
</table>
</form>
 </div>
</body>
</html>
