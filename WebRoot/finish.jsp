<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'finish.jsp' starting page</title>
    <style>
        p{
        width:38%;
        background: #37BC9B;
        color: #fff;
        margin: 20px 400px;
        padding: 2px;
        font-size: 2.2em;
        font-family: Constantia;
        
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
    h1,h3 { color: #CEF0D4; 
            font-family: 'Rouge Script', cursive; 
            font-size: 50px; 
            font-weight: normal; 
            line-height: 48px; 
            margin: 0 0 50px; 
            text-align: center; 
            text-shadow: 1px 1px 2px #082b34; 
          }
          div{
               margin-top:150px;
          }
          input[type=submit] {
            width: 45%;
            background-color: #4CAF50;
            color: white;
            padding: 24px 20px;
            margin: 50px 375px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
       }
       
    </style>        
	
     <script>
function printMe() {
    window.print()
}
</script>
  </head>
  
  <body>
    <div>
        <%   
            String rNumber= (String) session.getAttribute("rnumber");
        %>
        <h1>Congratulation!!! Your reservation is successful.</h1>
        <p>Your reservation id is: <%=rNumber%>.</p>
        <h3>Please keep this id for further procedure.</h3>
     </div>   
          <input type="submit" value="Print" onclick="printMe()">
        
  </body>
</html>
