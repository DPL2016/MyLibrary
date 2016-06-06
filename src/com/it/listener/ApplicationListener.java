package com.it.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class ApplicationListener
 *
 */
public class ApplicationListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ApplicationListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         ServletContext application = arg0.getServletContext();
         String dburl = application.getInitParameter("dburl");
         String dbname = application.getInitParameter("dbname");
         String dbpwd = application.getInitParameter("dbpwd");
         com.it.dao.Conf.DB_URL=dburl+"?user="+dbname+"&password="+dbpwd+"&useSSL=false";
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
