
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h1> Fibonacci </h1>
         <form action = "fibonacci.jsp">
            <label for="indice"> Índice:  </label>
            <input type="number" name="indice"><br><br>
            <input type="submit" value="Verificar">
         </form>
        
        <%  
            String errorMessage = null;
            int indice = 1;
            try{
                if(request.getParameter("indice") != null){
                    indice = Integer.parseInt(request.getParameter("indice"));
                    // n1 + n2 = n3            1 + 1 = 2         1 + 2 = 3           2 + 3 = 5
                    int n1 = 1;
                    int n2 = 1;
                    int n3 = 2;
                    for( int i = indice - 2; i > 0; i-- ){
                        n2 = n3;
                        n3 = n1 + n2;
                        n1 = n2;
                    }
                    out.println("<br> O valor do índice " + indice + " será: " + n1 );
                }
            }catch(Exception ex){
                errorMessage = ex.getMessage();
            }
            
        %>
    </body>
</html>
