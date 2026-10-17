package com.pizzashop;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * PizzaServlet serves the pizza menu as a JSON API at /api/pizzas.
 */
@WebServlet("/api/pizzas")
public class PizzaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JsonArray buildMenu() {
        JsonObject margherita = new JsonObject();
        margherita.addProperty("name", "Cheese Margherita");
        margherita.addProperty("description", "Classic Italian cheese pizza with fresh mozzarella and San Marzano tomatoes");
        margherita.addProperty("price", 12.99);
        margherita.addProperty("emoji", "🧀");

        JsonObject pepperoni = new JsonObject();
        pepperoni.addProperty("name", "Pepperoni Classic");
        pepperoni.addProperty("description", "Savory pepperoni pizza with extra cheese and crispy crust");
        pepperoni.addProperty("price", 16.99);
        pepperoni.addProperty("emoji", "🌶️");

        JsonObject veggie = new JsonObject();
        veggie.addProperty("name", "Veggie Delight");
        veggie.addProperty("description", "Fresh vegetables, bell peppers, olives, and mozzarella");
        veggie.addProperty("price", 14.50);
        veggie.addProperty("emoji", "🥦");

        JsonArray menu = new JsonArray();
        menu.add(margherita);
        menu.add(pepperoni);
        menu.add(veggie);
        return menu;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonArray menu = buildMenu();
        JsonObject result = new JsonObject();
        result.add("menu", menu);
        result.addProperty("shopName", "Pizza Shop");
        result.addProperty("deliveryTime", "30-45 mins");

        PrintWriter out = response.getWriter();
        out.print(result.toString());
        out.flush();
    }
}
