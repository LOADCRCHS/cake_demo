package com.cakesale.vo;

import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

public class Time_config {
    private String start_date;
    private String end_date;
    private List<Details> details;

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public List<Details> getDetails() {
        return details;
    }

    public void setDetails(List<Details> details) {
        this.details = details;
    }
}
