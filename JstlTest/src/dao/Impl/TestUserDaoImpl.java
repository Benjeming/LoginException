package dao.Impl;

import dao.UserDao;
import domian.User;
import org.junit.Test;

public class TestUserDaoImpl {
    UserDao dao = new UserDaoImpl();
    @Test
    public void testFinduserByPassword(){
        User ludans = dao.findUserByUserNameAndPassword("ludan", "123");
            System.out.println(ludans.toString());
    }
    @Test
    public void testCheckPassword(){
//        User user = new User();
//        user.setUserName("ludan");
//        user.setPassWord("123");
        boolean b = dao.checkPassword("ldans","123");
        System.out.println(b);
    }
}
