<%@page import="com.day.cq.wcm.foundation.List, com.day.cq.wcm.api.PageFilter" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<cq:includeClientLib categories="18f.cq" />
<%

    List list = new List(slingRequest, new PageFilter());
    list.setType("usa-topnav-list");
    request.setAttribute("list", list);
    //TODO set up grandchild listings
%>
