package web.servlet;

import domian.User;
import service.Impl.UserServiceImpl;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         * 步骤：
         *  1:设置编码
         *  2：获取表单参数.
         *  3：封装User对象
         *  4：验证码校验
         *  5:调用Service 查询
         *  6：判断是否登录成功
         *
         * */
        User user = new User();
        UserService service = new UserServiceImpl();
//        1:设置编码
        request.setCharacterEncoding("UTF-8");
//        2：获取表单参数.
        String userName = request.getParameter("inputUser");
        String userPassword = request.getParameter("inputPassword");
        String inputCheck = request.getParameter("inputCheck");
//        3：封装User对象
        user.setUserName(userName);
        user.setPassWord(userPassword);
        System.out.println("封装后："+user.getUserName() +"   "+user.getPassWord());

//        4：验证码校验
        HttpSession session = request.getSession();
        String piccode = (String) session.getAttribute("piccode");
        session.removeAttribute("piccode");

        if (!piccode.equalsIgnoreCase(inputCheck)) {
//            验证码不正确
//            提示信息
            request.setAttribute("login_msg", "验证码不正确");
//            跳转登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
//            检测密码和账号是否正确


        User loginUser = service.login(user);
        if (loginUser != null) {
            //查询成功
            session.setAttribute("users",user);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } else {
            //查询失败
            request.setAttribute("login_msg", "账号和密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
