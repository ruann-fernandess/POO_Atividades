<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String errorMessage = null;
    double n=2;
    try{
        if(request.getParameter("mult")!=null){
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
        <h1>Multiplication Table</h1>
        <form action = "multiplication-table.jsp">
            <input type = "number" name = "n" value = "<%=n%>"/>
            <input type = "submit" name = "mult" value ="Generate"/>
        </form>
        <table>
            <%for(int i = 1; i <= 10; i++) {%>
            <tr>
                <td> <%= n%> </td>
                <td>x <%= 1%> </td>
                <td>= <%= n*i%> </td>
            </tr>
                <%}%>
            </tr>
        </table>
    </body>
</html>
