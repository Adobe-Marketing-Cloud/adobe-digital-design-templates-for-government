package gov.eighteenf.cq.comps;

import com.day.cq.wcm.foundation.Image;
import gov.eighteenf.cq.utils.Utilities;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.DefaultInjectionStrategy;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.injectorspecific.Self;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.util.Random;

/**
 * Created by John Dorrance
 */
@Model(adaptables = {Resource.class}, defaultInjectionStrategy = DefaultInjectionStrategy.OPTIONAL)
public class Hero {
    @Self private Resource resource;
    @Inject @Default(booleanValues = false) private boolean spanFullPageWidth;
    @Inject @Default(values = "no-repeat") private String imageStyling;
    @Inject @Default(values = "cover") private String imageSizing;
    @Inject @Default(values = "center center") private String backgroundPosition;
    @Inject private String topPadding;
    @Inject private String bottomPadding;
    @Inject private String leftPadding;
    @Inject private String rightPadding;
    @Inject private String topMargin;
    @Inject private String bottomMargin;
    @Inject private String bgcolor;
    @Inject private String cssClass;
    private String bgID;
    private boolean containsLargeBGImage;

    @PostConstruct
    public void setup() {
        bgID = Utilities.getCacheBust();
        containsLargeBGImage = resource.getChild("bgImage") != null && new Image(resource.getChild("bgImage")).hasContent();
    }



    public String getLargeBGURL() {
        return resource.getPath() + "/bgImage.img.png";
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public boolean getSpanFullPageWidth() {
        return spanFullPageWidth;
    }

    public boolean isSpanFullPageWidth() {
        return spanFullPageWidth;
    }

    public void setSpanFullPageWidth(boolean spanFullPageWidth) {
        this.spanFullPageWidth = spanFullPageWidth;
    }

    public String getImageStyling() {
        return imageStyling;
    }

    public void setImageStyling(String imageStyling) {
        this.imageStyling = imageStyling;
    }

    public String getImageSizing() {
        return imageSizing;
    }

    public void setImageSizing(String imageSizing) {
        this.imageSizing = imageSizing;
    }

    public String getBackgroundPosition() {
        return backgroundPosition;
    }

    public void setBackgroundPosition(String backgroundPosition) {
        this.backgroundPosition = backgroundPosition;
    }

    public String getTopPadding() {
        return topPadding;
    }

    public void setTopPadding(String topPadding) {
        this.topPadding = topPadding;
    }

    public String getBottomPadding() {
        return bottomPadding;
    }

    public void setBottomPadding(String bottomPadding) {
        this.bottomPadding = bottomPadding;
    }

    public String getLeftPadding() {
        return leftPadding;
    }

    public void setLeftPadding(String leftPadding) {
        this.leftPadding = leftPadding;
    }

    public String getRightPadding() {
        return rightPadding;
    }

    public void setRightPadding(String rightPadding) {
        this.rightPadding = rightPadding;
    }

    public String getTopMargin() {
        return topMargin;
    }

    public void setTopMargin(String topMargin) {
        this.topMargin = topMargin;
    }

    public String getBottomMargin() {
        return bottomMargin;
    }

    public void setBottomMargin(String bottomMargin) {
        this.bottomMargin = bottomMargin;
    }

    public String getBgcolor() {
        return bgcolor;
    }

    public void setBgcolor(String bgcolor) {
        this.bgcolor = bgcolor;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public String getBgID() {
        return bgID;
    }

    public void setBgID(String bgID) {
        this.bgID = bgID;
    }

    public boolean getContainsLargeBGImage() {
        return containsLargeBGImage;
    }

    public boolean isContainsLargeBGImage() {
        return containsLargeBGImage;
    }

    public void setContainsLargeBGImage(boolean containsLargeBGImage) {
        this.containsLargeBGImage = containsLargeBGImage;
    }

}
