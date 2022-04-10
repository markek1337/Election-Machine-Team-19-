<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>
<%@ page import="java.util.ArrayList" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
td:nth-of-type(1) {

display: none;

}
#myInput {
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#candidates {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#candidates th, #candidates td {
  text-align: left;
  padding: 12px;
}

#candidates tr {
  border-bottom: 1px solid #ddd;
}

#candidates tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
  }
  th {
  cursor: pointer;
}
th:hover {
  background-color: #dddddd;
}
</style>
<title>Candidates</title>
<%@ include file="header.jsp" %> 
</head>
<body>

<input type="text" id="myInput" onkeyup="searchBar()" placeholder="Search for names.." title="Type in a name">

<br><br><br> <table id="candidates">
<tr class="header">
	
	<th onclick="sortTable(1)">Name</th>
	<th onclick="sortTable(2)">Surname</th>
	<th onclick="sortTable(3)">Party</th>
	<th>More info</th>
</tr>
<c:forEach var="candidate" items="${sessionScope.allcandidates }">
	<tr>
		<td>${candidate.id }</td>
		<td>${candidate.surname }</td>
		<td>${candidate.name }</td>
		<td>${candidate.party }</td>
		<td>
			<a href="/candidatesinfo?id=${candidate.id }">See more</a>
		</td>
</c:forEach>
</table>

<script>
function searchBar() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("candidates");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
//   for (i = 0; i < tr.length; i++) {
// 	    td = tr[i].getElementsByTagName("td")[2];
// 	    if (td) {
// 	      txtValue = td.textContent || td.innerText;
// 	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
// 	        tr[i].style.display = "";
// 	      } else {
// 	        tr[i].style.display = "none";
// 	      }
// 	    }       
// 	  } 
//   for (i = 0; i < tr.length; i++) {
// 	    td = tr[i].getElementsByTagName("td")[3];
// 	    if (td) {
// 	      txtValue = td.textContent || td.innerText;
// 	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
// 	        tr[i].style.display = "";
// 	      } else {
// 	        tr[i].style.display = "none";
// 	      }
// 	    }       
// 	  }
}

function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("candidates");
	  switching = true;
	  dir = "asc"; 
	  while (switching) {
	    switching = false;
	    rows = table.rows;
	    for (i = 1; i < (rows.length - 1); i++) {
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      if (dir == "asc") {
	    	  x = x.innerText.toLowerCase();
	    	  y = y.innerText.toLowerCase();
	    	  if (x.localeCompare(y, 'en', {numeric: true}) > 0) {
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      switchcount ++;      
	    } else {
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
</script>
</body>
</html>