<%@ page import="gov.eighteenf.cq.utils.Utilities" %>
<%@include file="/apps/18f/components/shared/global.jsp" %>
<%
    pageContext.setAttribute("openInNewWindowJS", "window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;");
    pageContext.setAttribute("divid", Utilities.getCacheBust());
    pageContext.setAttribute("facebookEnabled", properties.get("facebookEnabled" , Boolean.class));
    pageContext.setAttribute("twitterEnabled", properties.get("twitterEnabled" , Boolean.class));
    pageContext.setAttribute("youtubeEnabled", properties.get("youtubeEnabled" , Boolean.class));
    pageContext.setAttribute("rssEnabled", properties.get("rssEnabled" , Boolean.class));
%>

<cq:includeClientLib categories="18f.cq" />

<div class="usa-social-links" id="${divid}">

    <c:if test="${facebookEnabled}">
        <a href="http://www.facebook.com/sharer.php?u=urlgoeshere" class="sharelink facebook" onclick="${openInNewWindowJS}" target="_blank" title="Share this page!">
            <svg width="26" height="39" role="img" aria-label="Facebook">
                <title>Facebook</title>
                <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/etc/designs/18f/img/social-icons/svg/facebook25.svg" src="/etc/designs/18f/img/social-icons/png/facebook25.png" width="26" height="39"></image>
            </svg>
        </a>
    </c:if>

    <c:if test="${twitterEnabled}">
        <a href="https://twitter.com/share?url=urlgoeshere" class="sharelink twitter" onclick="${openInNewWindowJS}" target="_blank" title="Tweet this page!">
            <svg width="26" height="39" role="img" aria-label="Twitter">
                <title>Twitter</title>
                <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/etc/designs/18f/img/social-icons/svg/twitter16.svg" src="/etc/designs/18f/img/social-icons/png/twitter16.png" width="26" height="39"></image>
            </svg>
        </a>
    </c:if>

    <c:if test="${youtubeEnabled}">
        <a href="http://www.youtube.com">
            <svg width="26" height="39" role="img" aria-label="YouTube">
                <title>YouTube</title>
                <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/etc/designs/18f/img/social-icons/svg/youtube15.svg" src="/etc/designs/18f/img/social-icons/png/youtube15.png" width="26" height="39"></image>
            </svg>
        </a>
    </c:if>

    <c:if test="${rssEnabled}">
        <a href="${currentPage.path}.rss.xml" target="_blank">
            <svg width="26" height="39" role="img" aria-label="RSS">
                <title>RSS</title>
                <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/etc/designs/18f/img/social-icons/svg/rss25.svg" src="/etc/designs/18f/img/social-icons/png/rss25.png" width="26" height="39"></image>
            </svg>
        </a>
    </c:if>

</div>
<script>(function () {$("#${divid} a").each(function () {this.href = this.href.replace("urlgoeshere",escape(window.location.href) );});}());</script>