<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dron
  Date: 01.08.2018
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <title>Weather</title>
</head>
<body>
<form action="/getWeather" method="get">
        <div class="col-4">
            <div class="form-group mb-2">
                <label for="city" class="col-form-label-sm">City:</label>
                <input type="text" class="form-control col-form-label-sm" id="city" name="city"
                       placeholder="Enter city">
            </div>
        </div>
        <input class=" btn btn-outline-primary btn-sm mb-2" type="submit" value="Enter City">
</form>
<div class="col-6">
    <div class="table-responsive-sm">
        <c:if test="${!empty weat}">
            <table class="table table-sm table-bordered">
                <thead>
                <tr align="center" class="table-active">
                    <th>City</th>
                    <th>Temp</th>
                    <th>Humidity</th>
                    <th>Main</th>
                </tr>
                </thead>
                <tbody>
                    <%--<c:forEach items="${studentList}" var="student">--%>
                <tr align="center">
                    <td>${weat.name}</td>
                    <td>${weat.temp}C</td>
                    <td>${weat.humidity}%</td>
                    <td>${weat.main}</td>
                        <%--<td><a href="<c:url value='/remove/${student.id}'/>">Delete</a></td>--%>
                </tr>
                    <%--</c:forEach>--%>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
