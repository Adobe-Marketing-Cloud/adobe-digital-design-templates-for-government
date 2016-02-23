package gov.eighteenf.cq.comps;

public class RowItem {


    public String getIncludeString() {
        return "column" + String.valueOf(idx);
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    private int idx = 0;
    private String cssClass;

    public String getCssClass() {
        return cssClass;
    }
    public void setCssClass(String clazzz) {
        this.cssClass = clazzz;
    }
}
