package com.it.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessonListener
 *
 */
public class SessonListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public SessonListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         ServletContext application = arg0.getSession().getServletContext();
         Object count = application.getAttribute("count");
         if(count==null){
        	 application.setAttribute("count", 1);
         }else{
        	 application.setAttribute("count", Integer.parseInt( application.getAttribute("count").toString())+1);
         }
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         ServletContext application = arg0.getSession().getServletContext();
         Object count = application.getAttribute("count");
         application.setAttribute("count", Integer.parseInt(application.getAttribute("count").toString())-1);
    }
	
}
