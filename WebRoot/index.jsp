<html>
  <head>
    <title>Search page</title>
    <style>
        select {
        width: 40%;
        padding: 12px 20px;
        margin: 8px 375px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
       }
       input[type="date"] {
        width: 40%;
        padding: 12px 20px;
        margin: 8px 375px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 1px;
        box-sizing: border-box;
        cursor:pointer;
       }
       
       input[type=submit] {
            width: 40%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 15px 375px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
       }
       label{
            margin-left:375px;
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
   <script type="text/javascript">
    var datefield=document.createElement("input")
    datefield.setAttribute("type", "date")
    if (datefield.type!="date"){ //if browser doesn't support input type="date", load files for jQuery UI Date Picker
        document.write('<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><\/script>\n')
        document.write('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"><\/script>\n')
    }
</script>

<script>
    if (datefield.type!="date"){ //if browser doesn't support input type="date", initialize date picker widget:
        jQuery(function($){ //on document.ready
            $('#start_date').datepicker({
                dateFormat: 'mm-dd-yy'
            });
            $('#end_date').datepicker({
                dateFormat: 'mm-dd-yy'
            });
        })
    }
</script>
   
  </head>
  
  <body>
   <h1>Welcome to railway reservation system.</h1>
   <div>
    <form action="SearchServlet" method="post"> 
    <label for="sname">Source</label><br> 
    <select name="source">
    <option value="0" selected>Select your source</option>
      <option value="Dhaka">Dhaka</option>
      <option value="Rajshahi">RajShahi</option>
     </select><br>   
    <label for="dname">Destination</label><br>
    <select name="destination">
      <option value="0" selected>Select your destination</option>
      <option value="Dhaka">Dhaka</option>
      <option value="Rajshahi">RajShahi</option>
    </select><br>   
   <label for="date">Date</label><br>
   <input name="day" id="start_date" type="date" required/>
      <label for="tclass">Class</label><br> 
      <select name="tclass">
      <option value="0" selected>Select your class </option>
         <option value="AC Seat">AC Seat</option>
         <option value="AC Berth">AC Berth</option>
         <option value="Snigdha">Snigdha</option>
         <option value="ShovonChair">ShovonChair</option>
      </select>   
      
        <input type="submit" value="Search"/>
       
    
    </form>
   </div> 
   
  </body>
</html>
