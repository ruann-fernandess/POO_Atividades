<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros Compostos</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Cálculo de Juros Compostos</h1>
        
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
                
                out.println("<h3>Resultado - Tabela de Valores Acumulados:</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Mês</th><th>Valor Futuro (R$)</th></tr>");
                
                for (int i = 1; i <= meses; i++) {
                    // Cálculo do valor futuro usando a fórmula de juros compostos
                    double valorFuturo = principal * Math.pow((1 + taxa), i);
                    out.println("<tr><td>" + i + "</td><td>" + valorFuturo + "</td></tr>");
                }
                
                out.println("</table>");
            }
        %>
    </body>
</html>
