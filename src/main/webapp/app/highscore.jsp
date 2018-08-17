<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gatis.laizans01
  Date: 8/17/2018
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Highscore</h1>
<!-- CSS Code: Place this code in the document's head (between the 'head' tags) -->
<style>
    table.highscoretable {
        width: 50%;
        background-color: #ffffff;
        border-collapse: collapse;
        border-width: 2px;
        border-color: #000000;
        border-style: solid;
        color: #000000;
    }

    table.highscoretable td, table.GeneratedTable th {
        border-width: 2px;
        border-color: #000000;
        border-style: solid;
        padding: 3px;
    }

    table.highscoretable thead {
        background-color: #a0e9fe;
    }
</style>




<button type="back" onclick="back()">Back to menu</button>
<script>
    function back() {
        fetch("<c:url value='/api/auth/logout'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/start.jsp";
            });
    }
</script>
</body>
</html>
