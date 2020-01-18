package service.Impl;

import dao.UserDao;
import dao.Impl.UserDaoImpl;
import domian.User;
import service.UserService;

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
