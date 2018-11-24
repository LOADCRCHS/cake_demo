package com.cakesale.pojo;

public class Specification {  //食用规格实体类
    private Integer id;                    //规格id
    private String tablewareNum;      //餐具数
    private Double length;             //长度
    private Double width;              //宽度
    private Double height;             //高度
    private Double weight;             //重量

    @Override
    public String toString() {
        return "Specification{" +
                "id=" + id +
                ", tablewareNum='" + tablewareNum + '\'' +
                ", length=" + length +
                ", width=" + width +
                ", height=" + height +
                ", weight=" + weight +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTablewareNum() {
        return tablewareNum;
    }

    public void setTablewareNum(String tablewareNum) {
        this.tablewareNum = tablewareNum;
    }

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getWidth() {
        return width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }
}
