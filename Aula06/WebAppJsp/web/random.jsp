<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    double n=10;
    try{
        if(request.getParameter("random")!=null){
            n = Double.parseDouble(request.getParameter("n"));
        }
    }catch(Exception ex){
        errorMessage = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4><a href='index.jsp'>Voltar</a></h4>
        <h1>JSP</h1>
        <h1>Random numbers</h1>
        <form action = "random.jsp">
            <input type = "number" name = "n" value = "<%=n%>"/>
            <input type = "submit" name = "random" value ="Generate"/>
        </form>
        <table border ='1'>
            <tr>
                <th>Index</th>
                <th>Number</th>
            </tr>
            <%for(int i = 1; i <= n; i++) {%>
            <% int random = ((int)(100 * Math.random())); %>
            <tr>
                <td> <%= i%> </td>
                <td> <%= random%> </td>
            </tr>
                <%}%>
            </tr>
        </table>
    </body>
</html>
