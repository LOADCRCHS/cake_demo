package com.cakesale.vo;

import java.util.List;

public class Data {
    private boolean is_limited;
    private List<String> filter_period;
    private String matched_list;

    public boolean isIs_limited() {
        return is_limited;
    }

    public void setIs_limited(boolean is_limited) {
        this.is_limited = is_limited;
    }

    public List<String> getFilter_period() {
        return filter_period;
    }

    public void setFilter_period(List<String> filter_period) {
        this.filter_period = filter_period;
    }

    public String getMatched_list() {
        return matched_list;
    }

    public void setMatched_list(String matched_list) {
        this.matched_list = matched_list;
    }
}
