<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.hero-image {
  background-image: url("https://www.murfreesborotn.gov/ImageRepository/Document?documentID=14095");
  background-color: #cccccc;
  height: 900px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}
    
    </style>
    <title>Hello App Engine</title>
    <%@ include file="jsp/header.jsp" %> 
  </head>

  <body>
<div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:50px">Election machine</h1>

  </div>
</div>




  </body>
<%@ include file = "jsp/footer.jsp" %>
</html>