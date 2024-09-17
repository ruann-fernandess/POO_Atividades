<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormatSymbols" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
    </head>
    <body>
        <h1>Calendar</h1>
        <h4><a href='index.jsp'>Voltar</a></h4>

        <%
            String errorMessage = null;
            int year = 2023;
            int month = 1;

            try {
                if(request.getParameter("year") != null && request.getParameter("month") != null) {
                    year = Integer.parseInt(request.getParameter("year"));
                    month = Integer.parseInt(request.getParameter("month")) - 1;
                }
            } catch(Exception ex) {
                errorMessage = ex.getMessage();
            }

            if (errorMessage == null) {
                Calendar calendar = Calendar.getInstance();
                calendar.set(year, month, 1);

                int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                String monthName = new DateFormatSymbols().getMonths()[month];

        %>
        <h2><%= monthName %> <%= year %></h2>
        <table border="1" cellpadding="5">
            <tr>
                <th>D</th> <!-- Domingo -->
                <th>S</th> <!-- Segunda -->
                <th>T</th> <!-- Terça -->
                <th>Q</th> <!-- Quarta -->
                <th>Q</th> <!-- Quinta -->
                <th>S</th> <!-- Sexta -->
                <th>S</th> <!-- Sábado -->
            </tr>
            <tr>
            <%
                // Preencher os dias em branco até o primeiro dia do mês
                for (int i = Calendar.SUNDAY; i < firstDayOfWeek; i++) {
                    out.print("<td></td>");
                }

                // Preencher os dias do mês
                for (int day = 1; day <= daysInMonth; day++) {
                    out.print("<td>" + day + "</td>");

                    // Quebrar a linha no sábado
                    if ((firstDayOfWeek + day - 1) % 7 == 0) {
                        out.print("</tr><tr>");
                    }
                }

                // Completar a última semana com células em branco
                int remainingDays = (firstDayOfWeek + daysInMonth - 1) % 7;
                if (remainingDays != 0) {
                    for (int i = remainingDays; i < 7; i++) {
                        out.print("<td></td>");
                    }
                }
            %>
            </tr>
        </table>
        <%
            } else {
        %>
        <div style="color:red"><%= errorMessage %></div>
        <% } %>
    </body>
</html>

