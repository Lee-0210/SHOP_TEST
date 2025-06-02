package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		
		Cookie[] cookies = req.getCookies();
		String rememberMe = null;
		String token = null;
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("rememberMe")) {
					rememberMe = cookie.getValue();
					break;
				}
				if(cookie.getName().equals("token")) {
					token = cookie.getValue();
				}
			}
		}
		
		
		
		
		
		
		chain.doFilter(req, res);
	}
}
