<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Simples</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Cálculo de Juros Simples</h1>
        
        <form method="post">
            <label for="principal">Montante Inicial (R$): </label>
            <input type="number" name="principal" step="0.01" required><br><br>
            
            <label for="taxa">Taxa de Juros (% ao mês): </label>
            <input type="number" name="taxa" step="0.01" required><br><br>
            
            <label for="meses">Quantidade de Meses: </label>
            <input type="number" name="meses" required><br><br>
            
            <input type="submit" value="Calcular">
        </form>
        
        <% 
            String principalStr = request.getParameter("principal");
            String taxaStr = request.getParameter("taxa");
            String mesesStr = request.getParameter("meses");
            
            if (principalStr != null && taxaStr != null && mesesStr != null) {
                double principal = Double.parseDouble(principalStr);
                double taxa = Double.parseDouble(taxaStr) / 100;
                int meses = Integer.parseInt(mesesStr);
                
                double valorFuturo = principal * (1 + (taxa * meses));
                
                out.println("<h3>Resultado:</h3>");
                out.println("<p>Montante Inicial: R$ " + principal + "</p>");
                out.println("<p>Taxa de Juros: " + (taxa * 100) + "% ao mês</p>");
                out.println("<p>Quantidade de Meses: " + meses + "</p>");
                out.println("<p><strong>Valor Futuro: R$ " + valorFuturo + "</strong></p>");
            }
        %>
    </body>
</html>
