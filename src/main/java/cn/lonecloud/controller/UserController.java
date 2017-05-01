package cn.lonecloud.controller;

import cn.lonecloud.bean.User;
import cn.lonecloud.dto.Msg;
import cn.lonecloud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by lonecloud on 17/4/30.
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pn", defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page, 5);
        List<User> users = userService.selectAll();
        PageInfo pageInfo = new PageInfo(users);
        model.addAttribute("pageInfo", pageInfo);
        return "/list";
    }

    @ResponseBody
    @RequestMapping("/users")
    public Msg getUserWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer page) {
        PageHelper.startPage(page, 5);
        List<User> users = userService.selectAll();
        PageInfo pageInfo = new PageInfo(users);
        return Msg.success().add("pageinfo", pageInfo);
    }

}
