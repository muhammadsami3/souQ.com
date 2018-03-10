/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Muhammad Sami
 */
public class adminpageFilter implements Filter {
    
    private static final boolean debug = true;
    private FilterConfig filterConfig = null;
    
    public adminpageFilter() {
    }    

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
          HttpServletRequest req=(HttpServletRequest)request;

        HttpSession session=req.getSession(true);
        
        if(session.getAttribute("Id")!=null){
        chain.doFilter(request, response);
        System.out.println("isLoginFilter.doFilter()chain cont");
    }
    else{
        System.out.println("isLoginFilter.doFilter() Chain Stoped");
      HttpServletResponse res=(HttpServletResponse)response;
      res.sendRedirect("/souQ/user/jsp/login.jsp");
      
    }
    }

    @Override
    public void destroy() {
    }
    
}
