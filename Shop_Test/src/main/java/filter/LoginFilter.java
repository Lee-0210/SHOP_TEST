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
import jakarta.servlet.http.HttpSession;
import shop.dao.UserRepository;
import shop.dto.PersistentLogin;

public class LoginFilter extends HttpFilter implements Filter {
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession hs = req.getSession();
		UserRepository userRepository = new UserRepository();	
		
		Cookie[] cookies = req.getCookies();
		String rememberMe = null;
		String token = null;
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("rememberMe")) {
					rememberMe = cookie.getValue();
				}
				if(cookie.getName().equals("token")) {
					token = cookie.getValue();
				}
			}
		}
		
		if(rememberMe != null && token != null) {
			System.out.println("유저의 토큰 : " + token);
			PersistentLogin user = userRepository.selectTokenByToken(token);
			System.out.println("자동로그인 에서 찾은 아이디 : " + user.getUserId());
			hs.setAttribute("loginId", user.getUserId());
		}
		
		chain.doFilter(req, res);
	}
}