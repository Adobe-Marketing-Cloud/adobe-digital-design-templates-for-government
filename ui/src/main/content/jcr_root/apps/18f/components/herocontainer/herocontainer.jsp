<%@ page import="gov.eighteenf.cq.comps.Hero" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    Hero hero = resource.adaptTo(Hero.class);
    pageContext.setAttribute("hero", hero);
    if(authorShow) pageContext.setAttribute("cacheBust", "?" + hero.getBgID());
%>
<cq:includeClientLib categories="18f.cq" />
<%-- to make this more semantic it might make a lot of sense to add a full page width class, etc --%>
<style type="text/css">
    #${hero.bgID} {
    <c:if test="${hero.containsLargeBGImage}">
        background-repeat: ${hero.imageStyling};
        background-size: ${hero.imageSizing};
    <c:if test="${not empty hero.backgroundPosition}"> background-position: ${hero.backgroundPosition};</c:if>
    </c:if>
    <c:if test="${hero.spanFullPageWidth}">
        padding-left: 3000px;
        margin-left: -3000px;
        padding-right: 3000px;
        margin-right: -3000px;
    </c:if>
    <c:if test="${not empty hero.topPadding}"> padding-top: ${hero.topPadding}px;</c:if>
    <c:if test="${not empty hero.bottomPadding}"> padding-bottom: ${hero.bottomPadding}px;</c:if>
    <c:if test="${not empty hero.leftPadding and not hero.spanFullPageWidth}"> padding-left: ${hero.leftPadding}px;</c:if>
    <c:if test="${not empty hero.rightPadding and not hero.spanFullPageWidth}"> padding-right: ${hero.rightPadding}px;</c:if>
    <c:if test="${not empty hero.topMargin}"> margin-top: ${hero.topMargin}px;</c:if>
    <c:if test="${not empty hero.bottomMargin}"> margin-bottom: ${hero.bottomMargin}px;</c:if>
    <c:if test="${not empty hero.bgcolor}"> background-color: #${hero.bgcolor};</c:if>
    <c:if test="${hero.containsLargeBGImage}">background-image: url('${hero.largeBGURL}${cacheBust}'); </c:if>
    }
    

</style>

<div class="${hero.cssClass}" id="${hero.bgID}">
    <cq:include path="containerPar" resourceType="18f/components/herocontainer/customparsys" />
</div>

<c:if test="${hero.spanFullPageWidth && hero.containsLargeBGImage && hero.imageSizing == 'cover'}">
    <script type="text/javascript">
        (function(){
            function _resizebg(){
                var _bgcontainer = $("#${hero.bgID}");
                var paddingwidth = ($(window).width() - _bgcontainer.width()) + "px";
                var negpaddingwidth = "-" + paddingwidth;
                _bgcontainer.css({ "padding-left": paddingwidth, "padding-right": paddingwidth, "margin-left" : negpaddingwidth, "margin-right" : negpaddingwidth });
            }
            _resizebg();
            jQuery(window).on('resize', _.debounce(_resizebg, 250));
        }());
    </script>
</c:if>