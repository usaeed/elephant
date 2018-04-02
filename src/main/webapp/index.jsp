<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "tesco";
	String userid = "root";
	String password = "root";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
</head>
<body>

	<h1>Retrieve data from database in jsp</h1>
	<table cellspacing='0'>
		<thead>
			<tr>
				<th>tescoId
				</td>
				<th>tescoName
				</td>
				<th>tescoBranch
				</td>
				<th>tescoLoc
				</td>
			</tr>
		</thead>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + database, userid, password);
				statement = connection.createStatement();
				String sql = "select * from tescoepping";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tbody>
			<tr class="even">
				<td><%=resultSet.getString("tescoId")%></td>
				<td><%=resultSet.getString("tescoName")%></td>
				<td><%=resultSet.getString("tescoBranch")%></td>
				<td><%=resultSet.getString("tescoLoc")%></td>
			</tr>
			<%
				}
					connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</tbody>
	</table>
</body>
</html>