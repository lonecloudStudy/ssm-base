package cn.lonecloud.service;

import cn.lonecloud.bean.User;

import java.util.List;

/**
 * Created by lonecloud on 17/4/30.
 */
public interface UserService {

    List<User> selectAll();

    void save(User user);

    void update(User user);

    void deleteById(String id);

    User selectById(String id);

    boolean checkUserName(String name);
}
