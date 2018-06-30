<%@ page  language="java" import="java.util.*,java.text.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
    <title>Ticket reservation</title>
    <style>
        select {
        width: 40%;
        padding: 12px 20px;
        margin: 8px 400px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
       }
       input[type=text] {
        width: 40%;
        padding: 12px 20px;
        margin: 8px 400px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
       }
       input[type=submit] {
            width: 40%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 15px 400px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
       }
       label{
            margin-left:400px;
           color:white;
       }
       input[type=submit]:hover {
            background-color: #45a049;
       }
       div {
           margin: 50px 50px;
           
          
       }
       h1 { color: #CEF0D4; 
            font-family: 'Rouge Script', cursive; 
            font-size: 50px; 
            font-weight: normal; 
            line-height: 48px; 
            margin: 0 0 50px; 
            text-align: center; 
            text-shadow: 1px 1px 2px #082b34; 
          }

       
    body, html {
    height: 100%;
    margin: 0; 
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
<form action="ViewServlet" method="post">
<%    
        String source= (String)session.getAttribute("source");
        String destination= (String)session.getAttribute("destination");
        String day= (String)session.getAttribute("day");  
        String tClass= (String)session.getAttribute("tclass");
        
        session.setAttribute("source",source);
        session.setAttribute("destination",destination);
        session.setAttribute("day",day);  
	    session.setAttribute("tclass",tClass);  
	    System.out.print(tClass);
     %>
     <h1>
         Ticket reservation for <%=source %> to <%=destination %> on <%=day %>.
     </h1> 
         
    <label for="name">Name</label><br>
    <input type="text" name="pname"><br>
    <label for="mNO">Mobile No</label>
    <input type="text" name="mobileno">
    <label for="pNo">Passenger No</label><br>
    <select name="passengerno" >
    <option value="0">Enter passenger no</option>
        <%
           for(int i=1;i<=5;i++){
        %> 
          <option value="<%=i%>"><%=i%></option>      
        <%    
        }
        %>
        </select><br> 
      <%        
    
      try {   
  	
            String connectionURL = "jdbc:mysql://localhost:3306/test";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            PreparedStatement ps;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root",      
            "12345");
            statement = connection.createStatement();
  
       
           String sql = "SELECT trainname,departure from timeschedule where date=? and source=? and destination=? and class=?";
           ps= connection.prepareStatement(sql);
           ps.setString(1,day);
           ps.setString(2,source);
           ps.setString(3,destination);
           ps.setString(4,tClass);
           rs = ps.executeQuery();
      %>

     <label for="tTime">Train and time</label><br> 
     <select name="trainname">
       <option value="0" selected>Select train name and time </option>
       <%
          while (rs.next()) {
       %>
             <option value= <%=rs.getString(1)+"_"+rs.getString(2)%> ><%=rs.getString(1)+"_"+rs.getString(2)%> </option>                             
      <%}%>
     </select>
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
   <br>
 
     
  <input type="submit" value="submit">
</form>



</body>
</html>