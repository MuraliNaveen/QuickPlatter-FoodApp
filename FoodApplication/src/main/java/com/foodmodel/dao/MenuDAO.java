package com.foodmodel.dao;


import java.util.ArrayList;


import com.foodmodel.pojo.Menu;



public interface MenuDAO {
    int insert(Menu m);
    ArrayList<Menu> fetchAll();
    Menu fetchSpecific(int menuId);
    int update(Menu m);
    int delete(int menuId);
    ArrayList <Menu>getOnRid(int rid);
}
