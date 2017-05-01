package cn.lonecloud.test.mybatis;

import cn.lonecloud.bean.Department;
import cn.lonecloud.bean.User;
import cn.lonecloud.dao.UserMapper;
import cn.lonecloud.utils.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Random;

/**
 * Created by lonecloud on 17/4/30.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class EmployeeTest  {

    @Autowired
    UserMapper userMapper;
    @Autowired
    SqlSessionTemplate sqlSession;

    @Test
    public void testUser(){
        User user=new User();
        userMapper.insert(new User());
    }

    /**
     * 批量插入人员
     */
    @Test
    public void getBatchUser(){
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        Random random=new Random();
        User user=new User();
        long now = System.currentTimeMillis();
        for (int i = 0; i < 1000; i++) {
            String name=StringUtils.getUUID().substring(20);
            user.setName(name);
            user.setSex(random.nextInt(2)>0?"M":"F");
            user.setEmail(name+"@qq.com");
            user.setCreateTime(new Date());
            mapper.insert(user);
        }
        long end=System.currentTimeMillis()-now;
        System.out.println(end);
    }
}
