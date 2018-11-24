package com.cakesale.vo;

import java.util.Date;

public class Details {
    private String start_date;
    private String  end_date;
    private String start_time;
    private String end_time;
    private String interval;
    private String default_time;

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

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getInterval() {
        return interval;
    }

    public void setInterval(String interval) {
        this.interval = interval;
    }

    public String getDefault_time() {
        return default_time;
    }

    public void setDefault_time(String default_time) {
        this.default_time = default_time;
    }
}
