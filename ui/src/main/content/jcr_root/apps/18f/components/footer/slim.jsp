<%@include file="/apps/18f/components/shared/global.jsp" %>
<footer class="usa-footer usa-footer-slim usa-sans" role="contentinfo">
    <div class="usa-grid usa-footer-return-to-top">
        <a href="#top">Return to top</a>
    </div>
    <div class="usa-footer-primary-section">
        <div class="usa-grid-full">
            <nav class="usa-footer-nav usa-width-two-thirds">
                <cq:include path="footerleft" resourceType="foundation/components/parsys"/>
            </nav>
            <div class="usa-width-one-third usa-footer-primary-content">
                <cq:include path="footerright" resourceType="foundation/components/parsys"/>
            </div>
        </div>
    </div>

    <div class="usa-footer-secondary_section">
        <div class="usa-grid">
            <div class="usa-footer-logo">
                <div class="usa-footer-slim-logo-img">
                    <cq:include path="${effectiveResourcePath}/bgImage" resourceType="foundation/components/image"/>
                </div>
                <cq:text tagName="h3" tagClass="usa-footer-slim-logo-heading" value="${agencyName}"/>
            </div>
        </div>
    </div>
</footer>