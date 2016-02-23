<%@ page import="com.day.cq.commons.jcr.JcrUtil" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    String buttonType = properties.get("buttonType","");
    if(buttonType.contains("inverse"))
        pageContext.setAttribute("wrapperClass2","button_wrapper-dark");
    String hyperlink = properties.get("link","#");
    if(hyperlink.startsWith("/content") && !hyperlink.contains("/content/dam") && !hyperlink.contains(".html")){
        hyperlink = hyperlink.concat(".html");
    }
    pageContext.setAttribute("hyperlink", hyperlink);
    pageContext.setAttribute("buttontext", properties.get("label", "Button Text"));
%>
<cq:includeClientLib categories="18f.cq" />
<div class="button_wrapper ${wrapperClass2}">
    <a class="usa-button ${properties.buttonType}" href="${hyperlink}" role="button">${buttontext}</a>
</div>
