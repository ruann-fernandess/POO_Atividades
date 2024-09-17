<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int x = 10;
    int y = 10;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSP</h1>
        <h1>Index</h1>
        <h2>Using expression</h2>
        <div> <%= new java.util.Date() %></div>
        <h2>Using scriplet</h2>
        <div><% out.println(new java.util.Date()); %> </div>
        <h3>Exemplos</h3>        
        
        <div> <%= x + y %> 
            <%--
            <%
                int x = 10;
                int y = 10;
                int z = x + y;
                out.println(z);
            %>
            --%>
        </div>
                
        <h4>Sum</h4>
        <form action = "sum.jsp">
            <input type = "number" name = "n1"/>+
            <input type = "number" name = "n2"/>
            <input type = "submit" name = "sum" value ="="/>
        </form>
        
        <h4>Radom numbers</h4>
        <form action = "random.jsp">
            <input type = "number" name = "n" value = "10"/>
            <input type = "submit" name = "random" value ="Generate"/>
        </form>
        
        <h4>Multiplication Table</h4>
        <form action = "multiplication-table.jsp">
            <input type = "number" name = "n" value = "2"/>
            <input type = "submit" name = "mult" value ="Generate"/>
        </form>
    </body>
</html>
