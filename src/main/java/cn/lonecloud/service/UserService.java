package cn.lonecloud.service;

import cn.lonecloud.bean.User;

import java.util.List;

/**
 * Created by lonecloud on 17/4/30.
 */
public interface UserService {

    List<User> selectAll();
}
