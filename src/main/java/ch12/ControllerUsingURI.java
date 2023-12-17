package ch12;



import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




//@WebServlet("/bbb")
public class ControllerUsingURI  extends HttpServlet{
	 private Map<String, CommandHandler> commandHandlerMap = 
	    		new HashMap<>();
   @Override
   public void init() throws ServletException {
      // TODO Auto-generated method stub
      System.out.println("init");
      String configFile = getInitParameter("configFile");
      //web.xml의   <param-name>configFile</param-name>
      //1 commandHandler.properties 파일의 url=servlet name 의 정보를 저장한다 
      System.out.println(configFile);
      Properties  prop = new Properties();
      String configFilePath = getServletContext().getRealPath(configFile);
      try (FileReader fis = new FileReader(configFilePath)) {
         prop.load(fis);
       } catch (IOException e) {
               throw new ServletException(e);
           }
      System.out.println(prop);
      Iterator keyIter = prop.keySet().iterator();
      
      while(keyIter.hasNext()) {
    	  String command = (String) keyIter.next();
    	  String handlerClassName = prop.getProperty(command);
          try {
        	 Class<?> handlerClass = Class.forName(handlerClassName);
			CommandHandler handlerInstance = 
			          (CommandHandler) handlerClass.newInstance();
		   commandHandlerMap.put(command, handlerInstance);
          } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		}    	       }
      
      System.out.println(commandHandlerMap);
      
      
      
      super.init();
   }
   
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      System.out.println("doget");
      doProcess(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
	   doProcess(req, resp);
   }
   
   private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // TODO Auto-generated method stub
	     System.out.println("doProcess");
	 	String command = request.getRequestURI();   //url  /jspPro/member/hello
	 	if (command.indexOf(request.getContextPath()) == 0) {   //request.getContextPath() project명
			command = command.substring(request.getContextPath().length()+1);  //length 이후 값
		}
	   System.out.println(command);  //project명 제거 
	   
	   CommandHandler handler = commandHandlerMap.get(command);
       if (handler == null) {           handler = new NullHandler();       }
	   
       String viewPage=null;
       try {
		viewPage = handler.process(request, response);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
       RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
       dispatcher.forward(request, response);
	   
	         
       
       
       
       
       
       
       
       
       
       
	   }
}


