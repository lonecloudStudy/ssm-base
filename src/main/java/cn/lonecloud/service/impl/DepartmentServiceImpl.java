package cn.lonecloud.service.impl;

import cn.lonecloud.bean.Department;
import cn.lonecloud.dao.DepartmentMapper;
import cn.lonecloud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lonecloud on 17/5/1.
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{

    @Autowired
    DepartmentMapper departmentMapper;
    @Override
    public List<Department> getAllDept() {
        return departmentMapper.selectByExample(null);
    }
}
