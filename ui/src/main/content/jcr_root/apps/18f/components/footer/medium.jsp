<%@include file="/apps/18f/components/shared/global.jsp" %>
<footer class="usa-footer usa-footer-medium usa-sans" role="contentinfo">
    <div class="usa-grid usa-footer-return-to-top">
        <a href="#top">Return to top</a>
    </div>
    <div class="usa-footer-primary-section">
        <div class="usa-grid-full">
            <nav class="usa-footer-nav">
                <cq:include path="footerleft" resourceType="foundation/components/parsys"/>
            </nav>
        </div>
    </div>

    <div class="usa-footer-secondary_section">
        <div class="usa-grid">
            <div class="usa-footer-logo usa-width-one-half">
                <div class="usa-footer-logo-img">
                    <cq:include path="${effectiveResourcePath}/bgImage" resourceType="foundation/components/image"/>
                </div>
                <h3 class="usa-footer-logo-heading">${agencyName}</h3>
            </div>

            <div class="usa-footer-contact-links usa-width-one-half">
                <cq:include path="${effectiveResourcePath}/sociallinks" resourceType="18f/components/sociallinks"/>
                <cq:include path="${effectiveResourcePath}/address" resourceType="18f/components/address"/>
            </div>
        </div>
    </div>
</footer>