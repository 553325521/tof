package com.os.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;


public class LoginFilter extends OncePerRequestFilter {

    /**
     * 登录验证过滤
     */

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // 不过滤的uri
        String[] notFilter = new String[]{"/bootstrap-3.3.7-dist", "/img", "/showLogin", "/js", "/ueditor", "/css",
                "/upload", "/index", "/showRegister", "/studentArea", "/showQuestionDetail", "/showUpdatePwd", "/getQuestionData", "/showQuestionDetail",
                "/login", "/replyController/sendReply", "/replyController/getReplyData", "/showTeachInfo", "/noticeController/getNoticeData", "/getLastNoticeData",
                "/showTeachInfoDetail", "/studentToTeacher", "/showStudentToTeacherDetail", "/getReplyCountByQId", "/showTeachResource", "/getResourceData", "/download", "/file"};

        // 请求的uri
        String uri = request.getRequestURI();
        // 是否过滤
        boolean doFilter = true;
        for (String s : notFilter) {
            if (uri.indexOf(s) != -1) {
                // 如果uri中包含不过滤的uri，则不进行过�?
                doFilter = false;
                break;
            }
        }

        if (doFilter) {
            // 执行过滤
            Object obj = request.getSession()
                    .getAttribute("SESSION_USER");
            if (null == obj) {
            	/*String path = request.getContextPath();
            	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";*/
                response.sendRedirect("showLogin");
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
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String header = request.getHeader("X-Requested-With");
        return header != null && "XMLHttpRequest".equals(header);
    }

}
