package gov.eighteenf.cq.utils;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceUtil;
import org.apache.sling.api.resource.ValueMap;

import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

/**
 * Created by John Dorance
 */
public class Utilities {
    public static String getCacheBust() {
        Random r = new java.util.Random();
        String alphabet = "abcdefghijklmnopqrstuvwxyz";
        String randomDivId = "rand_";
        for (int i = 0; i < 15; i++) {
            randomDivId = randomDivId + alphabet.charAt(r.nextInt(alphabet.length()));
        }
        return randomDivId;
    }

    /**
     * Walk up tree to find actual resource that contains any of the requested properties.
     *
     * Ex:
     *    TreeUtils.findEffectiveProperty( resource,  ['navrootnode', 'title'] );
     *
     * @param Resource resource
     * @param List<String> properties
     * @return String
     */
    public static Resource findEffectiveResource(Resource resource,String contentStructure, List<String> properties) {
        if(resource == null)return null;
        if (Pattern.matches("^/content/.*", resource.getPath())) {
            //Verify that we still have some content
            Resource inResource =  resource.getResourceResolver().getResource(resource, contentStructure);
            if(inResource != null){
                ValueMap inheritedValueMap =  inResource.adaptTo(ValueMap.class);
                for (String property : properties) {
                    if (inheritedValueMap.containsKey(property) ) {
                        return resource;
                    }
                }
            }
            return findEffectiveResource(ResourceUtil.getParent(resource),contentStructure, properties);
        }
        return null;
    }
}
