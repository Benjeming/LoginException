package dao.Impl;

import dao.UserDao;
import domian.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

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
