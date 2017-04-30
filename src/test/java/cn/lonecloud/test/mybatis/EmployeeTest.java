package cn.lonecloud.test.mybatis;

import cn.lonecloud.bean.User;
import cn.lonecloud.dao.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by lonecloud on 17/4/30.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class EmployeeTest  {

    @Autowired
    UserMapper userMapper;

    @Test
    public void testUser(){
        userMapper.insert(new User());
    }
}
