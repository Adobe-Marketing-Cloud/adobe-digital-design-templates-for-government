<%@ page import="gov.eighteenf.cq.utils.Utilities" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    List<String> footerProps = new ArrayList<String>();
    footerProps.add("footerType");

    Resource parentResource = Utilities.findEffectiveResource(resource,"jcr:content/footerparsys/footer", footerProps);
    Resource effectiveResource = (parentResource != null) ? parentResource.getChild("jcr:content/footerparsys/footer") : resource;
    ValueMap effectiveValueMap = effectiveResource.adaptTo(ValueMap.class);
    request.setAttribute("agencyName", effectiveValueMap.get("agencyName",""));
    request.setAttribute("footertype",effectiveValueMap.get("footerType","slim"));
    request.setAttribute("effectiveResourcePath", effectiveResource.getPath());
    WCMMode currentMode = WCMMode.fromRequest(request);
    if(!resource.getPath().equals(effectiveResource.getPath())){
        WCMMode.DISABLED.toRequest(request);
        pageContext.setAttribute("footerIsInherited",true);
    }
%>
<c:if test="${footerIsInherited and authorShow}">
    <script type="text/javascript">CQ.WCM.onEditableReady("${resource.path}", function(editable){editable.disable();}, this);</script>
</c:if>
<cq:includeClientLib categories="18f.cq" />
<cq:include script="${footertype}.jsp"/>
<%
    currentMode.toRequest(request);
%>