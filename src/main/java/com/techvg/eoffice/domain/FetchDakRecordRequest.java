package com.techvg.eoffice.domain;

import org.springframework.stereotype.Component;

@Component
public class FetchDakRecordRequest {

    private String start_date;

    private String end_date;

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
}
