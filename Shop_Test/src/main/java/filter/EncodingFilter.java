package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	
	private FilterConfig filterConfig;
	private String encoding;

	
	public void init(FilterConfig filterConfig) throws ServletException {
    	System.out.println("EncodingFilter 초기화 ...");
    	this.filterConfig = filterConfig;
    	this.encoding = filterConfig.getInitParameter("encoding"); // UTF-8
    	System.out.println("설정된 encoding : " + encoding);
    }
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		filterChain.doFilter(request, response);
	} 
}







