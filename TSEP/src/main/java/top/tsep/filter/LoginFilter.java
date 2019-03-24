package top.tsep.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class LoginFilter extends OncePerRequestFilter {

	/** 登录验证过滤 */

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// 不过滤的uri
		String[] notFilter = new String[] { "/img", "/login", "/ico", "/js", "/excel", "/css", "/upload", "/fonts",
				"/login.jsp", "/register.jsp", "/email_templates", "/font-awesome", "/locales", "/pdf",
				"/getSubject","/login","/register"};

		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean doFilter = true;
		for (String s : notFilter) {
			if (uri.indexOf(s) != -1) {
				doFilter = false;
				break;
			}
		}

		if (doFilter) {
			Object obj = request.getSession().getAttribute("SESSION_USER");
			if (null == obj) {
				response.sendRedirect("/TSEP/login.jsp");
				return;
			} else {
				filterChain.doFilter(request, response);
			}
		} else {
			filterChain.doFilter(request, response);
		}
	}

	/**
	 * 判断是否为Ajax请求 <功能详细描述>
	 * 
	 * @param request
	 * @return 是true, 否false
	 * @see [类�?�类#方法、类#成员]
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		return header != null && "XMLHttpRequest".equals(header);
	}
}
