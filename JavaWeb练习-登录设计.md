# JavaWeb练习-登录设计

JavaWeb设计中讲究三层架构，其三层分别是 View ，控制层 ，model 。

软件架构如图所示，分别代表不同的层次，其中控制层 是包含 Servlet层 ，Service层  也就是业务逻辑层，以及 dao 层 ，就是数据库操作层.

Model层 就是 domain 里面装的是一些实体类。

View层 是整个web页面。

![Stract_mvc](https://github.com/Benjeming/images/blob/master/images/Stract_Mvc.png)

### LoginServlet

> 步骤：
>
> * 1：设置编码
> * 2：获取表单参数.
> * 3：封装User对象
> * 4：验证码校验
> * 5：调用Service 查询
> * 6：判断是否登录成功

相关代码 loginServlet.java

```java
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
```

### 心得

> 关键点在于 service 层的编写。
>
> 业务逻辑层与dao 数据操作主要的目的是，将其他 业务逻辑 和数据库操作分开，有效的解耦。
>
> 现在有不熟悉的地方在，业务层 的编写
>
> 业务层的编写 是与需求挂钩的，所以说要知道需求。
>
> 举个栗子
>
> 1. 需要有个登录业务，该业务逻辑该怎么样来写?
>
> * 首先明确，登录业务需要什么参数，也就是说 登录需要什么？很明显，登录需要有账户和密码。那么，至少需要两个参数，一个是账户，另外一个是密码。
> * 第二点就是，返回类型。登录业务，你需要什么样的返回类型。
> * 下面看下login 的业务逻辑是怎么实现的

UserService.java

```java
public interface UserService {
    public User login(User user);
    public boolean login1(User user);
}
```

UserServiceImpl.java

```java
public class UserServiceImpl implements UserService {
    UserDao dao = new UserDaoImpl();

    @Override
    public User login(User user) {
        return dao.findUserByUserNameAndPassword(user.getUserName(),user.getPassWord());
    }

    @Override
    public boolean login1(User user) {
        return dao.checkPassword(user.getUserName(),user.getPassWord());
    }
}
```

dao层

UserDao.java

```java
public interface UserDao {
    public User findUserByUserNameAndPassword(String userName , String passWord);
    boolean checkPassword(String userName , String passWord);
}
```

UserDaoImpl.java

```java
public class UserDaoImpl implements UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public User findUserByUserNameAndPassword(String userName, String passWord) {
        try {
            String sql = "select * from userlogin where userName = ? and passWord = ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userName, passWord);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    @Override
    public boolean checkPassword(String userName , String passWord) {
       try{
           String sql = "select * from userlogin where userName = ? and passWord = ?";
           User user1 = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),userName, passWord);
           System.out.println("user::"+user1.toString());
           return true;
       }catch (Exception e){
           e.printStackTrace();
           return false;
       }
    }
}
```

其中实现方法有两个，~~但是 checkPassword()方法 写法有点问题~~，后来经过测试，发现这两种写法都是正确的。当 SQL未查询到 数据时，就会抛出异常，抛出异常的同时，都会返回一个值，前一种写法，就会返回一个 null ；后一种写法，就会返回一个 false。

> 一般来说，SQL查询 返回值无非两种情况，
>
> 1. 返回查询的内容。没查询到，就返回空； 有数据，就返回相对应的数据。
> 2. 返回是否查询成功。没查询到，就返回false； 查询到了，就返回 true。