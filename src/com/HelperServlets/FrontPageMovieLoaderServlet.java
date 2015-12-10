package com.HelperServlets;

import Common.AppwideConstants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Robert on 12/9/2015.
 */
@WebServlet(name = "FrontPageMovieLoaderServlet")
public class FrontPageMovieLoaderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(getServletContext().getInitParameter(AppwideConstants.DB_CONNECTION_STRING_KEY)
            );

            request.setAttribute("newMoviesList", getNewestMovies(con));
            request.setAttribute("featuredMoviesList", getFeaturedMovies(con));

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private List<Map> getNewestMovies(Connection con) {
        Statement st = null;
        try {
            st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT MovieID, Title, coverImage FROM Movie ORDER BY releaseDate desc LIMIT 12");

            return loadMovieItems(rs);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private List<Map> getFeaturedMovies(Connection con) {
        Statement st = null;
        try {
            st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select m.movieID, m.Title, m.coverImage from purchase as p inner join movie as m on p.movieID = m.movieID where datediff(current_date(), p.purchaseDate) < 32 group by m.movieID order by count(m.movieID) desc limit 12");

            return loadMovieItems(rs);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private  List<Map> loadMovieItems(ResultSet rs)
    {
        String movieID, movieTitle, coverURL;
        List<Map> movieItems = new ArrayList<Map>();

        try {
            while(rs.next()){
                Map item = new HashMap();
                movieID = rs.getString(1);
                movieTitle = rs.getString(2);
                coverURL = rs.getString(3);

                item.put("movieID", movieID);
                item.put("movieTitle", movieTitle);
                item.put("coverURL", coverURL);

                movieItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movieItems;
    }
}
