package com.cakesale.vo;

public class Invoice {

    private String invoice_id;
    private int electronic_flag = 1;
    private int personal_flag = 1;
    private String content;
    private String company_name;
    private String tax_number;
    private String receive_mobile;

    public String getInvoice_id() {
        return invoice_id;
    }

    public void setInvoice_id(String invoice_id) {
        this.invoice_id = invoice_id;
    }

    public int getElectronic_flag() {
        return electronic_flag;
    }

    public void setElectronic_flag(int electronic_flag) {
        this.electronic_flag = electronic_flag;
    }

    public int getPersonal_flag() {
        return personal_flag;
    }

    public void setPersonal_flag(int personal_flag) {
        this.personal_flag = personal_flag;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getTax_number() {
        return tax_number;
    }

    public void setTax_number(String tax_number) {
        this.tax_number = tax_number;
    }

    public String getReceive_mobile() {
        return receive_mobile;
    }

    public void setReceive_mobile(String receive_mobile) {
        this.receive_mobile = receive_mobile;
    }
}
