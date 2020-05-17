<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" />
<section class="login-page">
    <h2>Załóż konto</h2>
<%--    <form>--%>
<form:form method="post" modelAttribute="user">
    <form:hidden path="id" />
        <div class="form-group">
            <input type="text" name="username" placeholder="username" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
        </div>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group form-group--buttons">
<%--            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>--%>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
</form:form>
<%--    </form>--%>
</section>

<jsp:include page="footer.jsp" />
<script src="<c:url value="/resources/js/app.js"/>"></script>