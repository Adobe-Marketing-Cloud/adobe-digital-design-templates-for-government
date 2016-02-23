<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    pageContext.setAttribute("showFooter", pageProperties.get("showFooter", "show").equalsIgnoreCase("show"));
%>
<cq:includeClientLib categories="18f.cq" />

<div class="main-content" id="main-content">
    <div class="styleguide-content usa-content">
        <cq:include path="bodyparsys" resourceType="18f/components/page/bodyparsys"/>
    </div>
    <c:if test="${showFooter}">
        <cq:include path="footerparsys" resourceType="foundation/components/iparsys" />
    </c:if>
</div>

