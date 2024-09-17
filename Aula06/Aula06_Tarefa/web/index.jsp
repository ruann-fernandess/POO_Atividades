<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Calendar</title>
    </head>
    <body>
        <h1>Calendar</h1>
        <form action="calendar.jsp">
            <label for="year">Year:</label>
            <input type="number" name="year" value="2023" />
            <label for="month">Month:</label>
            <input type="number" name="month" value="1" min="1" max="12"/>
            <input type="submit" value="Generate" />
        </form>
    </body>
</html>
