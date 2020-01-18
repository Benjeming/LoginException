package dao;

import domian.User;

public interface UserDao {
    public User findUserByUserNameAndPassword(String userName , String passWord);
    boolean checkPassword(String userName , String passWord);
}
