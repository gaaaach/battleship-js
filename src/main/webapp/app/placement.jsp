<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Ship Placement</title>
</head>
<body onload="checkStatus()">
<div id="wait-another" class="w3-hide">
    <h1>Please wait another player</h1>
</div>
<div id="placement-field" class="w3-hide">
    <table>
        <tr>
            <td>&nbsp;</td>
            <c:forTokens items="A,B,C,D,E,F,G,H,I,J" delims="," var="col">
                <td><c:out value="${col}"/></td>
            </c:forTokens>
        </tr>
        <c:forTokens items="1,2,3,4,5,6,7,8,9,10" delims="," var="row">
            <tr>
                <td><c:out value="${row}"/></td>
                <c:forTokens items="A,B,C,D,E,F,G,H,I,J" delims="," var="col">
                    <td><input type="checkbox" id="${col}${row}" onchange="cellClicked('${col}${row}')"/></td>
                </c:forTokens>
            </tr>
        </c:forTokens>
    </table>
    <button type="button" onclick="ready()">Ready!</button>
</div>
<script>
    var data = {};
    function cellClicked(id) {
        var checkbox = document.getElementById(id);
        console.log(id + " " + checkbox.checked);
        data[id] = checkbox.checked ? "SHIP" : "EMPTY";
    }
    function ready() {
        console.log(JSON.stringify(data));
        fetch("<c:url value='/api/game/cells'/>", {
            "method": "POST",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        }).then(function (response) {
            console.log("DONE");
            checkStatus();
        });
    }
    function checkStatus() {
        console.log("checking status");
        fetch("<c:url value='/api/game/status'/>", {
            "method": "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
            return response.json();
        }).then(function (game) {
            console.log(JSON.stringify(game));
            if (game.status === "PLACEMENT" && game.playerActive) {
                document.getElementById("placement-field").classList.remove("w3-hide");
                document.getElementById("wait-another").classList.add("w3-hide");
            }else if (game.status === 'STARTED') {
                location.href = "<c:url value='/app/game.jsp'/>";
            }else {
                document.getElementById("placement-field").classList.add("w3-hide");
                document.getElementById("wait-another").classList.remove("w3-hide");
                window.setTimeout(function() {checkStatus();}, 1000);
            }
        });
    }


</script>
</body>
</html>