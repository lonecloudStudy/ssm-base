package cn.lonecloud.service.impl;

import cn.lonecloud.bean.User;
import cn.lonecloud.dao.UserMapper;
import cn.lonecloud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lonecloud on 17/4/30.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> selectAll() {
        /**
         * 查询所有员工
         */
        return userMapper.selectByExampleWithDept(null);
    }
}
