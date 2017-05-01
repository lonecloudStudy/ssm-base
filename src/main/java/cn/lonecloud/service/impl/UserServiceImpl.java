package cn.lonecloud.service.impl;

import cn.lonecloud.bean.User;
import cn.lonecloud.bean.UserExample;
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

    @Override
    public void save(User user) {
        userMapper.insert(user);
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void deleteById(String id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User selectById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean checkUserName(String name) {
        UserExample example=new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(example);
        return users==null||users.size()==0;
    }
}
