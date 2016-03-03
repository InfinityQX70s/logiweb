<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="Trucks"/>
</jsp:include>
<jsp:include page="../leftMenu.jsp">
    <jsp:param name="drivers" value=""/>
    <jsp:param name="orders" value=""/>
    <jsp:param name="trucks" value="active z-depth-2"/>
</jsp:include>
<p></p>
<table style="margin-top:40px;" class="striped z-depth-2 col s6 offset-s4 white">
    <thead>
    <tr>
        <th data-field="id">Number</th>
        <th data-field="capacity">Capacity</th>
        <th data-field="shift_size">Shift Size</th>
        <th data-field="state">State</th>
        <th data-field="change"></th>
        <th data-field="delete"></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="truck" items="${requestScope.trucks}">
    <tr>
        <td><c:out value="${truck.number}"/>
        </td>
        <td><c:out value="${truck.capacity}"/>
        </td>
        <td><c:out value="${truck.shiftSize}"/>
        </td>
        <c:if test="${truck.repairState}">
            <td>OK</td>
        </c:if>
        <c:if test="${not truck.repairState}">
        <td>Broken</td>
        </c:if>
        <c:if test="${empty truck.oreder}">
            <td>Free</td>
            <td>
                <a href="/employee/truck/<c:out value="${truck.number}"/>/edit" class="secondary-content light-blue-text text-accent-888">
                    <i class="material-icons">create</i>
                </a>
            </td>
            <td>
                <form action="/employee/truck/delete" method="post">
                    <input type="hidden" name="number" value="<c:out value="${truck.number}"/>">
                    <a class="secondary-content light-blue-text text-accent-888" style="margin-right:20px;" onclick="parentNode.submit();">
                        <i class="material-icons">clear</i>
                    </a>
                </form>
            </td>
        </c:if>
        <c:if test="${not empty truck.oreder}">
            <td>Assigned</td>
            <td>
            </td>
            <td>
            </td>
        </c:if>
    </tr>
    </c:forEach>
    </tbody>

</table>
<div class="col s6 offset-s4 right-align">
    <a href="/employee/truck/add" style="margin-top:5px;" class="right btn-floating btn-large waves-effect waves-light light-blue accent-999"><i
            class="material-icons">add</i></a>
</div>
<c:if test="${requestScope.pageCount ne 1}">
    <div class="col s6 offset-s4 center-align">
        <ul class="pagination text-white">
            <c:forEach begin="1" end="${requestScope.pageCount}" varStatus="loop">
                <c:if test="${requestScope.currentPage eq loop.index}">
                    <li class="active light-blue accent-999 white-text"><a href="/employee/trucks?page=<c:out value="${loop.index}"/>"><c:out value="${loop.index}"/></a></li>
                </c:if>
                <c:if test="${requestScope.currentPage ne loop.index}">
                    <li class="waves-effect waves-light light-blue accent-999 light-blue-text text-accent-888"><a href="/employee/trucks?page=<c:out value="${loop.index}"/>"><c:out value="${loop.index}"/></a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</c:if>
<jsp:include page="../footer.jsp"/>