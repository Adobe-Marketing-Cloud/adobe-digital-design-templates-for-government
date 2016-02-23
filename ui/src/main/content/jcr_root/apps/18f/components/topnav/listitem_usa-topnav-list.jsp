<%@include file="/apps/18f/components/shared/global.jsp" %>
<cq:includeClientLib categories="18f.cq" />
<%
    Page listItem = (Page) request.getAttribute("listitem");
    pageContext.setAttribute("listitem", listItem);
    //todo figure out nested structures
%><li>
    <a href="${listitem.path}.html">
    ${not empty listitem.navigationTitle ? listitem.navigationTitle : listitem.title}
    </a>
</li>