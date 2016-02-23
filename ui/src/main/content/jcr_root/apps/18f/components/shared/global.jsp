<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" import="javax.jcr.*,
        java.util.*,
        com.day.cq.wcm.api.Page,
        com.day.cq.wcm.api.PageManager,
        org.apache.sling.api.resource.Resource,
        com.day.cq.wcm.commons.WCMUtils,
        com.day.cq.wcm.api.NameConstants,
        com.day.cq.wcm.api.designer.Designer,
        com.day.cq.wcm.api.designer.Design,
        com.day.cq.wcm.api.designer.Style,
        java.awt.Color,
        org.slf4j.LoggerFactory,
        org.slf4j.Logger,
        org.apache.sling.api.resource.ValueMap,
        com.day.cq.wcm.api.components.ComponentContext,
        com.day.cq.wcm.api.components.EditContext,
        com.day.cq.wcm.api.WCMMode,
        org.apache.commons.lang.*"%><%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %><%
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%
%><cq:defineObjects /><%
    boolean authorShow = WCMMode.fromRequest( request ) == WCMMode.EDIT;
    pageContext.setAttribute("authorShow", authorShow);
%>