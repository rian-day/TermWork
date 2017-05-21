package hyh.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MyRequest;

public class WebFilter extends HttpServlet implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException{ 
		 // 将请求和响应强制转换成Http形式
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        // 处理响应乱码
        response.setContentType("text/html;charset=utf-8");

        // 自定义一个request对象：MyRequest，对服务器原来的requset进行增强，使用装饰设计模式
        // 要增强原来的request对象，必须先获取到原来的request对象
        MyRequest myRequest = new MyRequest(request);

        // 注意：放行的时候应该传入增强后的request对象
        chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		// Put your code here
	}

	
//	@Override
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("何宇亨");
//	}
//	@Override
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}
}
