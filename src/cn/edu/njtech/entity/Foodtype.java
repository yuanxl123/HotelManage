package cn.edu.njtech.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 
 * FileName: Foodtype
 * 
 * @Description: 菜系实体类
 * 
 * @author: 刘明亮
 * 
 * @Createdate:2016/12/01
 * 
 * @version:1.0
 */
public class Foodtype implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * foodTypeId:菜系ID
	 */
	private int foodtypeid;

	/**
	 * typeName:菜系名称
	 */
	private String typename;

	/**
	 * food:菜系
	 */
	private Set<Food> foodSet = new HashSet<Food>(0);

	public Foodtype() {
		super();
	}

	public Foodtype(int foodtypeid, String typename, Set<Food> foodSet) {
		super();
		this.foodtypeid = foodtypeid;
		this.typename = typename;
		this.foodSet = foodSet;
	}

	public void setFoodtypeid(int foodtypeid) {
		this.foodtypeid = foodtypeid;
	}

	public int getFoodtypeid() {
		return foodtypeid;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getTypename() {
		return typename;
	}

	public void setFoodSet(Set<Food> foodSet) {
		this.foodSet = foodSet;
	}

	public Set<Food> getFoodSet() {
		return foodSet;
	}

	public String toString() {
		return "Foodtype [foodtypeid=" + foodtypeid + ",typename=" + typename
				+ ",foodSet=" + foodSet + "]";
	}

}
