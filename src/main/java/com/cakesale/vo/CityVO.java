package com.cakesale.vo;

import java.util.List;
public class CityVO {
    private int id;
    private String name;
    private List<CountyVO> childs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<CountyVO> getChilds() {
        return childs;
    }

    public void setChilds(List<CountyVO> childs) {
        this.childs = childs;
    }
}
