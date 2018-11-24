package com.cakesale.vo;

import java.util.List;
public class ProvinceVO {
    private int id;
    private String name;
    private List<CityVO> childs;

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

    public List<CityVO> getChilds() {
        return childs;
    }

    public void setChilds(List<CityVO> childs) {
        this.childs = childs;
    }
}
