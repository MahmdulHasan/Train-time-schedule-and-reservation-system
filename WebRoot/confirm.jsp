<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
  <head>
    <title>Ticket reservation confirmation</title>
    <style>
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
   li {
        width:40%;
        background: #37BC9B;
        color: #fff;
        counter-increment: myCounter;
        margin: 0 0 20px 0;
        padding: 2px;
        position:relative;
        top: 0px;
        border-radius:  1em 1em 1em 1em;
        padding-left: 2em;
        font-size: 1.2em;
        font-family: Constantia;
    }
    li:before{
        content: counter(myCounter, decimal-leading-zero);
        display: inline-block;
        text-align: center;
        font-size: 1em;
        line-height: 1.3em;
        background-color:  #48CFAD;
        padding: 8px;
        font-weight: bold;
        position: absolute; 
        top: 0;
        left: -40px;
        border-radius: 50%;
        font-family: exo;
    }


    li:nth-child(even){
        background-color: #434A54;
    }
    input[type=submit] {
            width: 46%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 15px 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
       }
       input[type=submit]:hover {
            background-color: #45a049;
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
       
    </style>    

  </head>
  
  <body>
  <form action="finish.jsp" method="post">
        
       <%!
           public int nullIntconv(String inv){   
                int conv=0;
                try{
                    conv=Integer.parseInt(inv);
                }
                catch(Exception e){}
                 return conv;
        }
        
       
%>
<%
        String source= (String)session.getAttribute("source");
        String destination= (String)session.getAttribute("destination");
        String day= (String)session.getAttribute("day"); 
        String tClass= (String)session.getAttribute("tclass"); 
        
        String pName= (String)request.getAttribute("pname");
        String mobileNo= (String)request.getAttribute("mobileno");
        String passengerNo= (String)request.getAttribute("passengerno");
        String trainName= (String)request.getAttribute("trainname");
          
        int pNo= nullIntconv(passengerNo);
        int amount=0;
        int rNumber1= (int)(System.currentTimeMillis());
        String rNumber= String.valueOf(rNumber1);
        session.setAttribute("rnumber",rNumber);
       
       
        if(tClass.equals("AC Seat"))
              amount=pNo*725;
              
              
       String tamount=String.valueOf(amount);       
        
 %> 
 <%
     try {   
  	
            String connectionURL = "jdbc:mysql://localhost:3306/test";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            PreparedStatement ps;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root",      
            "ivee");
            statement = connection.createStatement();
            String url="INSERT INTO confirmation(id,name,mobileno,source,destination,date,tnametime,tclass,passengerno,tamount)values (?,?,?,?,?,?,?,?,?,?)";
             ps=connection.prepareStatement(url);
             ps.setString(1,rNumber);
             ps.setString(2,pName);
             ps.setString(3,mobileNo);
             ps.setString(4,source);
             ps.setString(5,destination);
             ps.setString(6,day);
             ps.setString(7,trainName);
             ps.setString(8,tClass);
             ps.setString(9,passengerNo);
             ps.setString(10,tamount);
             ps.executeUpdate();
     
  /*
             String sql = "SELECT seat from timeschedule where date=? and source=? and destination=? and class=? and flag=?";
             ps= connection.prepareStatement(sql);
             ps.setString(1,day);
             ps.setString(2,source);
             ps.setString(3,destination);
             ps.setString(4,tClass);
             ps.setString(5,trainName);
             rs = ps.executeQuery();
             
             while (rs.next()) {
                  String se= rs.getString(1);
             }*/
             
      rs.close();
      statement.close();
      connection.close();
    }
    catch(Exception ex){
           System.out.println(ex);
     }
      
  %>
  
 
   <h1>Reservation details</h1>  
   <div style="margin-left:450px;">
    <ul>
      <li>Name: <%=pName %></li>
      <li>Mobile No: <%=mobileNo%></li>
      <li>Source: <%=source%></li>
      <li>Destination: <%=destination%></li>
      <li>Journey date: <%=day %></li>
      <li>Train name & Time: <%=trainName%></li>
      <li>Class: <%=tClass%></li>
      <li>Passenger No: <%=passengerNo%></li>
      <li>Total amount: <%=amount%></li>
   </ul>
               
     <input type="submit" value="confirm"/>
</div>        
            
            
         
</form>
    
  </body>
</html>
