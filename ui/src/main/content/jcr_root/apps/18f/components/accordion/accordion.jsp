<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    pageContext.setAttribute("accordions", Arrays.asList(properties.get("accordionTabs", new String[0])));
    if(authorShow){
        pageContext.setAttribute("breakcollapse","bla");
    }
    //TODO set up border vs borderless toggle
%>
<cq:includeClientLib categories="18f.cq" />

<div class="usa-accordion">
    <ul class="usa-unstyled-list" role="tablist" aria-multiselectable="true">
        <c:forEach items="${accordions}" varStatus="status" var="accordion">
            <li role="presentation">
                <button class="usa-button-unstyled" role="tab" aria-controls="colla${breakcollapse}psible-${status.index}" aria-expanded="${status.first or authorShow}">
                    ${accordion}
                </button>
                <div id="collapsibl${breakcollapse}e-${status.index}" role="tabpanel" aria-hidden="${not status.first and not authorShow}" class="usa-accordion-content">
                    <cq:include path="accordion-${status.index}" resourceType="foundation/components/parsys"/>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
