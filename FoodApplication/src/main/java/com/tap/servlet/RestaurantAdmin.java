package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodmodel.daoimpl.MenuDAOImp;
import com.foodmodel.daoimpl.RestaurantImp;
import com.foodmodel.pojo.Menu;
import com.foodmodel.pojo.Restaurant;
import com.foodmodel.pojo.User;


//@WebServlet("/RestaurantAdmin")
public class RestaurantAdmin extends HttpServlet {
	
  private HttpSession session;
private ArrayList<Menu> menuList;

@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  session=req.getSession();
        User u=(User)session.getAttribute("loggedInUser");
        String Email=req.getParameter("email");
        String Name=u.getUserName();
        System.out.println(Name);
        RestaurantImp rimp=new RestaurantImp();
        Restaurant r= rimp. getRestaurantDetails(Name);
        System.out.println("Restaurant fetched: " + r);
         session.setAttribute("Restaurant", r);
         int Rid=r.getR_ID();
         MenuDAOImp mip=new MenuDAOImp();
         menuList=mip.getOnRid( Rid);
         req.getSession().setAttribute("menuList", menuList);
         req.getRequestDispatcher("RestaurantAdmin.jsp").forward(req, resp);

         System.out.println("Session ID in servlet: " + session.getId());

         System.out.println("Logged in user: " + Name);
         System.out.println("Restaurant details set in session: " + r);

}
}