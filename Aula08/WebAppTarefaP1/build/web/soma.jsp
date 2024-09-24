
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1> Soma </h1>
        <form action = "soma.jsp">
            <label for="num"> Número:  </label>
            <input type="number" name="num"><br><br>
            <input type="submit" value="Somar">
         </form>
        
        <%  
            String errorMessage = null;
            int num = 0;
            try{
                if(request.getParameter("num") != null){
                    num = Integer.parseInt(request.getParameter("num"));
                    int soma = num;
                    for (int i = num - 1; i > 0; i--){
                        soma += i;
                    }
                    out.println("<br> A soma de 1 a " + num + " foi de: " + soma);
                }
            }catch(Exception ex){
                errorMessage = ex.getMessage();
            }
            
        %>
    </body>
</html>
