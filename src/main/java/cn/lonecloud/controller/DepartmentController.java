package cn.lonecloud.controller;

import cn.lonecloud.bean.Department;
import cn.lonecloud.dto.Msg;
import cn.lonecloud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by lonecloud on 17/5/1.
 */
@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Msg getAllDept(){
       List<Department> departments= departmentService.getAllDept();
        return Msg.success().add("departments",departments);
    }
}
