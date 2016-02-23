<%@include file="/apps/18f/components/shared/global.jsp" %>

<%
    pageContext.setAttribute("alertStyle", properties.get("alerttype", "usa-alert-info"));
%>

<cq:includeClientLib categories="18f.cq"/>

<div class="usa-alert ${alertStyle}" role="alert">
    <div class="usa-alert-body">
        <cq:text placeholder="Heading Text" property="headerText" tagName="h3" tagClass="usa-alert-heading"/>
        <div class="usa-alert-text">
            <cq:include path="alerttext" resourceType="foundation/components/text"/>
        </div>
    </div>
</div>