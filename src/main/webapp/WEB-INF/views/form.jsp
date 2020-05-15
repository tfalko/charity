<%--
  Created by IntelliJ IDEA.
  User: Falko
  Date: 06/05/2020
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Oddaj rzeczy, których już nie chcesz<br />
            <span class="uppercase">potrzebującym</span>
        </h1>

        <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
                <li>
                    <div><em>1</em><span>Wybierz rzeczy</span></div>
                </li>
                <li>
                    <div><em>2</em><span>Spakuj je w worki</span></div>
                </li>
                <li>
                    <div><em>3</em><span>Wybierz fundację</span></div>
                </li>
                <li>
                    <div><em>4</em><span>Zamów kuriera</span></div>
                </li>
            </ul>
        </div>
    </div>
</div>


<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

<%--        <form action="form-confirmation" method="post">--%>
            <!-- STEP 1: class .active is switching steps -->

        <form:form modelAttribute="donation" method="post">
        <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>


<%--                <form:checkboxes path="categories"--%>
<%--                                 items="${categories}"/>--%>

                <c:forEach items="${categories}" var="c" varStatus="loopCounter">
                <div class="form-group form-group--checkbox">

                    <label>
                        <input
                                type="checkbox"
                                name="categories"
                                value="<c:out value="${c.id}"/>"
                        />
                        <span class="checkbox"></span>
                        <span class="description"><c:out value="${c.name}"/></span>
                    </label>
                </div>
                    </c:forEach>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input
                                type="checkbox"
                                name="categories"
                                value="clothes-useless"
                        />
                        <span class="checkbox"></span>
                        <span class="description">ubrania, do wyrzucenia</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="categories" value="toys" />
                        <span class="checkbox"></span>
                        <span class="description">zabawki</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="categories" value="books" />
                        <span class="checkbox"></span>
                        <span class="description">książki</span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="checkbox" name="categories" value="other" />
                        <span class="checkbox"></span>
                        <span class="description">inne</span>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>



            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
<%--                        <form:input path="quantity"/>--%>
                        <input type="number" name="quantity" step="1" min="1"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>



            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
<%--                <form:select path="institution" items="${institutions}"/>--%>

                <c:forEach items="${institutions}" var="i" varStatus="loopCounter">
                    <form:hidden path="institution.id"/>
                <div class="form-group form-group--checkbox">
                    <label>

                        <input type="radio" name="organization" value="<c:out value="${i.id}"/>" />
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title">Fundacja “<c:out value="${i.name}"/>”</div>
<%--                            <form:hidden path="institution.id" />--%>
                  <div class="subtitle">
                    Cel i misja: <c:out value="${i.description}"/>
                  </div>
                </span>
                    </label>
                </div>
                </c:forEach>
                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="radio" name="organization" value="old" />
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title">Fundacja “Dla dzieci"</div>
                  <div class="subtitle">
                    Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji
                    życiowej.
                  </div>
                </span>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica
                                <input type="text" name="street" />
<%--                                <form:input path="street" id="street" />--%>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto
<%--                                <input type="text" name="city" />--%>
                                <form:input path="city"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy
<%--                                <input type="text" name="postcode" />--%>
                                <form:input path="zipCode" id="zipCode" />
                            </label>
                        </div>

<%--                        <div class="form-group form-group--inline">--%>
<%--                            <label>--%>
<%--                                (?) Numer telefonu--%>
<%--                                <input type="phone" name="phone" />--%>
<%--                            </label>--%>
<%--                        </div>--%>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data
<%--                                <input type="date" name="data" />--%>
                                <form:input type="date" path="pickUpDate" placeholder="yyyy-mm-dd"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina
<%--                                <input type="time" name="time" />--%>
                                <form:input type="time" path="pickUpTime"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
<%--                                <textarea name="more_info" rows="5"></textarea>--%>
                                <form:textarea path="pickUpComment" rows="5"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

<%--                <div class="summary">--%>
<%--                    <div class="form-section">--%>
<%--                        <h4>Oddajesz:</h4>--%>
<%--                        <ul>--%>
<%--                            <li>--%>
<%--                                <span class="icon icon-bag"></span>--%>
<%--                                <span class="summary--text"--%>
<%--                                >4 worki ubrań w dobrym stanie dla dzieci</span--%>
<%--                                >--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <span class="icon icon-hand"></span>--%>
<%--                                <span class="summary--text"--%>
<%--                                >Dla fundacji "Mam marzenie" w Warszawie</span--%>
<%--                                >--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="form-section form-section--columns">--%>
<%--                        <div class="form-section--column">--%>
<%--                            <h4>Adres odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li>Prosta 51</li>--%>
<%--                                <li>Warszawa</li>--%>
<%--                                <li>99-098</li>--%>
<%--                                <li>123 456 789</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>

<%--                        <div class="form-section--column">--%>
<%--                            <h4>Termin odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li>13/12/2018</li>--%>
<%--                                <li>15:40</li>--%>
<%--                                <li>Brak uwag</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
            </form:form>
        </form>
    </div>
</section>
<jsp:include page="footer.jsp" />
<script src="<c:url value="/resources/js/app.js"/>"></script>