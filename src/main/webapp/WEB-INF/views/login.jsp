<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />

<section class="login-page">
    <h2>Zaloguj się</h2>
<%--    <form method="post">--%>
<form:form method="post" modelAttribute="user" action="/login">
    <form:hidden path="id" />
        <div class="form-group">
            <input type="text" name="username" placeholder="user name" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group form-group--buttons">
            <a href="#" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
</form:form>
<%--    </form>--%>
</section>

<jsp:include page="footer.jsp" />
<script src="<c:url value="/resources/js/app.js"/>"></script>