<%@include file="/apps/18f/components/shared/global.jsp" %>

<%
    pageContext.setAttribute("grid", resource.adaptTo(gov.eighteenf.cq.comps.Grid.class));
%>

<cq:includeClientLib categories="18f.cq" />

<div class="${grid.cssClass}">
    <c:forEach var="rowItem" items="${grid.rowItems}">
        <div class="${rowItem.cssClass}">
            <cq:include path="${rowItem.includeString}" resourceType="foundation/components/parsys"/>
        </div>
    </c:forEach>
</div>