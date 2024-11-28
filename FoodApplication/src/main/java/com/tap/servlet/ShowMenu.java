package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodmodel.daoimpl.MenuDAOImp;
import com.foodmodel.pojo.Menu;




public class ShowMenu extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ArrayList<Menu> menuList;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rid=req.getParameter("restaurantId");
		
		int id=Integer.parseInt(rid);
		String RestaurantName=req.getParameter("restaurantname");
		System.out.println("This is Restaurant id: "+id);
		System.out.println("This is Restaurant Name : "+ RestaurantName);
		req.getSession().setAttribute("RestaurantName", RestaurantName);
		req.getSession().setAttribute("RestaurantId",id);
		MenuDAOImp mdimp=new MenuDAOImp();
		
		 menuList=mdimp.getOnRid(id);
		 req.getSession().setAttribute("menuList", menuList);
		
		 req.getRequestDispatcher("menu.jsp").forward(req, resp);
	}
}
