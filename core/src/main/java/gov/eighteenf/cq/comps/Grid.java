package gov.eighteenf.cq.comps;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.DefaultInjectionStrategy;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.injectorspecific.Self;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by John Dorrance
 */
@Model(adaptables = {Resource.class}, defaultInjectionStrategy = DefaultInjectionStrategy.OPTIONAL)
public class Grid {
    @Inject @Default(values = "o6x6") private String columnConfiguration;
    @Self private Resource resource;

    @PostConstruct
    protected void setup() {
        // TODO
    }

    public int getRowPosition() {
        //TODO
        return -1;
    }

    public List<RowItem> getRowItems() {
        String[] columnsByTheirWidths = columnConfiguration.substring(1,columnConfiguration.length()).split("x");
        List<RowItem> rows = new ArrayList<RowItem>();
        for (int i = 0; i < columnsByTheirWidths.length; i++) {
            String token = columnsByTheirWidths[i];
            String usaClass = convertColumnIndex(token);
            RowItem rowItem = new RowItem();
            rowItem.setCssClass(usaClass);
            rowItem.setIdx(i);
            rows.add(rowItem);
        }
        return rows;
    }
    public String getCssClass() {
        return "usa-grid";
    }

    public String getColumnConfiguration() {
        return columnConfiguration;
    }

    public void setColumnConfiguration(String columnConfiguration) {
        this.columnConfiguration = columnConfiguration;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    private String convertColumnIndex(String token){
        Map<String,String> mapvals = getConvertColumnsMap();
        if(mapvals.containsKey(token)){
            return mapvals.get(token);
        }else{
            throw new InvalidParameterException("Token " + token + " is not from 1 to 12");
        }
    }
    private Map<String,String> getConvertColumnsMap(){
        Map<String,String> _map = new HashMap<String,String>();
        _map.put("1", "usa-width-one-twelfth");
        _map.put("2", "usa-width-one-sixth");
        _map.put("3", "usa-width-one-fourth");
        _map.put("4", "usa-width-one-third");
        _map.put("5", "usa-width-unsupported5");
        _map.put("6", "usa-width-one-half");
        _map.put("7", "usa-width-unsupported7");
        _map.put("8", "usa-width-two-thirds");
        _map.put("9", "usa-width-three-fourths");
        _map.put("10", "usa-width-five-sixths");
        _map.put("11", "usa-width-unsupported11");
        _map.put("12", "usa-width-unsupported12");
        return _map;
    };
}

