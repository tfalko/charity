<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%--
  Created by IntelliJ IDEA.
  User: Falko
  Date: 06/05/2020
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj Agata
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="index.html" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="index.html#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.html#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>
    <div class="slogan container container--90">
        <h2>
            Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
            informacje o odbiorze.
        </h2>
    </div>
<%--        try--%>

    <div class="container container--90">
        <h3>Podsumowanie Twojej darowizny</h3>
        <div class="summary">
            <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                    <li>
                        <span class="icon icon-bag"></span>
                        <span class="summary--text"
                        ><c:out value="${sessionScope.donation.quantity}"/> worki </span
                        >
                    </li>

                    <li>
                        <span class="icon icon-hand"></span>
                        <span class="summary--text"
                        >Dla fundacji "<c:out value="${sessionScope.donation.institution.name}"/>"</span
                        >
                    </li>
                </ul>
            </div>

            <div class="form-section form-section--columns">
                <div class="form-section--column">
                    <h3>Adres odbioru:</h3>
                    <ul>
                        <li><c:out value="${sessionScope.donation.street}"/></li>
                        <li><c:out value="${sessionScope.donation.city}"/></li>
                        <li><c:out value="${sessionScope.donation.zipCode}"/></li>
                        <li>123 456 789</li>
                    </ul>
                </div>

                <div class="form-section--column">
                    <h3>Termin odbioru:</h3>
                    <ul>
                        <li><c:out value="${sessionScope.donation.pickUpDate}"/></li>
                        <li><c:out value="${sessionScope.donation.pickUpTime}"/></li>
                        <li><c:out value="${sessionScope.donation.pickUpComment}"/></li>
                    </ul>
                </div>

                <a href="/submit">submit</a>

            </div>
        </div>
    </div>




<jsp:include page="footer.jsp"/>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
