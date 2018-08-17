<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button type="button" onclick="logout()">Log out</button>
<button type="button" onclick="startGame()">Start Game</button>
<button type="button" onclick="highScore()">Highscore</button>
<script>
    function logout() {
        fetch("<c:url value='/api/auth/logout'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/";
            });
    }

    function startGame() {
        fetch("<c:url value='/api/game'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/placement.jsp";
            });
    }
    function highScore(){
        fetch("<c:url value='/api/game'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/highscore.jsp";
            });
    }
</script>
</body>
</html>
