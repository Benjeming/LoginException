package service.Impl;

import domian.User;
import org.junit.Test;
import service.UserService;

public class TestUserServiceImpl {
    UserService service = new UserServiceImpl();

    @Test
    public void TestUserServiceImpl(){
        User user =new User();

        user.setUserName("zhagsan");
        user.setPassWord("123");
//        System.out.println("User: "+user.toString());
//        User login = service.login(user);
//        System.out.println("Login"+login.toString());
        boolean b = service.login1(user);
        System.out.println(b);

    }
}
