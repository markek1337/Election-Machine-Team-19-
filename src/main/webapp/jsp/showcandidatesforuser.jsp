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
	// Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("candidates");
  tr = table.getElementsByTagName("tr");
//Loop through all table rows, and hide those who don't match the search query
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

function sortTable() {
	  var table, rows, switching, i, x, y, shouldSwitch;
	  table = document.getElementById("myTable");
	  switching = true;
	  /* Make a loop that will continue until
	  no switching has been done: */
	  while (switching) {
	    // Start by saying: no switching is done:
	    switching = false;
	    rows = table.rows;
	    /* Loop through all table rows (except the
	    first, which contains table headers): */
	    for (i = 1; i < (rows.length - 1); i++) {
	      // Start by saying there should be no switching:
	      shouldSwitch = false;
	      /* Get the two elements you want to compare,
	      one from current row and one from the next: */
	      x = rows[i].getElementsByTagName("TD")[0];
	      y = rows[i + 1].getElementsByTagName("TD")[0];
	      // Check if the two rows should switch place:
	      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	        // If so, mark as a switch and break the loop:
	        shouldSwitch = true;
	        break;
	      }
	    }
	    if (shouldSwitch) {
	      /* If a switch has been marked, make the switch
	      and mark that a switch has been done: */
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	    }
	  }
	}
</script>
</body>
</html>