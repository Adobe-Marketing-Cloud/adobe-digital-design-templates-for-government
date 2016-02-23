<%@include file="/apps/18f/components/shared/global.jsp" %>
<%@ page import="java.util.Date,
                 java.text.SimpleDateFormat,
                 com.day.cq.commons.Doctype,
                 org.apache.commons.lang3.StringEscapeUtils,
                 org.apache.commons.lang3.StringUtils" %>
<%
    String xs = Doctype.isXHTML(request) ? "/" : "";

    if (!properties.get("cq:lastModified", "").equals("")) {
        SimpleDateFormat sdf = new SimpleDateFormat("d MMM yyyy HH:mm:ss z");
        String date = sdf.format(properties.get("cq:lastModified", Date.class));
%>
<meta http-equiv="Last-Modified" content="<%= StringEscapeUtils.escapeHtml4(date) %>"<%=xs%>>
<%
    }

    if (!properties.get("cq:lastModifiedBy", "").equals("")) {
%>
<meta name="author" content="<%= StringEscapeUtils.escapeHtml4(properties.get("cq:lastModifiedBy", "")) %>"<%=xs%>>
<%
    }

    if (!properties.get("jcr:title", "").equals("")) {
%>
<meta name="title" content="<%= StringEscapeUtils.escapeHtml4(properties.get("jcr:title", "")) %>"<%=xs%>>
<%
    }

    if (!properties.get("subtitle", "").equals("")) {
%>
<meta name="subtitle" content="<%= StringEscapeUtils.escapeHtml4(properties.get("subtitle", "")) %>"<%=xs%>>
<%
    }

    if (properties.get("cq:tags", new String[0]).length > 0) {
%>
<meta name="tags"
      content="<%= StringEscapeUtils.escapeHtml4( StringUtils.join(properties.get("cq:tags", new String[0]), ",") ) %>"<%=xs%>>
<%
    }

%>
<cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
<%
    currentDesign.writeCssIncludes(pageContext);
%>
<cq:include script="init.jsp"/>
