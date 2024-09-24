<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h1> Número Primo </h1>
        <form action = "numero_primo.jsp">
            <label for="num"> Número:  </label>
            <input type="number" name="num"><br><br>
            <input type="submit" name="submit" value="Verificar">
         </form>
        
        <%  
            String errorMessage = null;
            int num = 0;
            try{
                if(request.getParameter("num") != null){
                    num = Integer.parseInt(request.getParameter("num")); 
                    int i = num;
                        for(i = num - 1; i > 1; i--){
                            if(num % i == 0){
                                out.println("<br> Seu número não é primo");
                                break;
                            }
                        }
                }
            }catch(Exception ex){
                errorMessage = ex.getMessage();
                out.println(errorMessage);
            }
            
        %>
    </body>
</html>
