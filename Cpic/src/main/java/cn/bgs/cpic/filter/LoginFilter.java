package cn.bgs.cpic.filter;


import cn.bgs.cpic.pojo.TbUser;
import cn.bgs.cpic.utils.AuthUtil;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/jsps/user/*")
public class LoginFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        TbUser user = (TbUser)req.getSession().getAttribute(AuthUtil.USERLOGIN);
        if (user==null){
            res.sendRedirect("/login.jsp");
        }else{
            chain.doFilter(req,res);
        }
    }
}
