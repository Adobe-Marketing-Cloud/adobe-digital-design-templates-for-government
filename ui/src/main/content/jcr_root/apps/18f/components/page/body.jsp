<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    // usa-grid vs usa-grid-full
    pageContext.setAttribute("pageLayout", pageProperties.get("pageLayout", "usa-grid"));
    pageContext.setAttribute("showHeader", pageProperties.get("showHeader", "show").equalsIgnoreCase("show"));
    pageContext.setAttribute("showSidenav", pageProperties.get("showSidenav", "show").equalsIgnoreCase("show"));
%>
<body class="${pageLayout}">
    <a name="top"></a>
    <cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext"/>
    <c:if test="${showHeader}">
        <cq:include script="header.jsp"/>
    </c:if>
    <cq:includeClientLib categories="18f.cq"/>
    <c:if test="${showSidenav}">
        <cq:include script="sidenav.jsp"/>
    </c:if>
    <cq:include script="content.jsp"/>
    <cq:include path="timing" resourceType="foundation/components/timing"/>
    <cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/>
</body>

<c:if test="${not authorShow}">
    <script>jQuery( document ).ready(function() {jQuery("html").attr("lang","en");});</script>
</c:if>