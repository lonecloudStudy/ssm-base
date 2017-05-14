package cn.lonecloud.controller;

import cn.lonecloud.bean.User;
import cn.lonecloud.dto.Msg;
import cn.lonecloud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lonecloud on 17/4/30.
 * 基于Restful风格的CRUD的Controller
 *
 * @author lonecloud
 * @Date 2017.4.30
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
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping("/list-ajax")
    public String ajaxIndex() {
        return "/list-ajax";
    }

    /**
     * 保存
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            //获取所有的错误信息
            Map<String,String> message=new HashMap<>();
            List<FieldError> allErrors = result.getFieldErrors();
            for (FieldError error :
                    allErrors) {
                message.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.error().add("message",message);
        }
        user.setCreateTime(new Date());
        userService.save(user);
        return Msg.success();
    }

    /**
     * 更新
     *
     * @param id
     * @param user
     * @return
     */
    @RequestMapping(value = "/user/${id)", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateUser(@PathVariable("id") String id, User user) {
        user.setId(id);
        userService.update(user);
        return Msg.success();
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteUser(@RequestParam("id") String id) {
        userService.deleteById(id);
        return Msg.success();
    }

    /**
     * 获取
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/user/${id}", method = RequestMethod.GET)
    public Msg getUser(@PathVariable("id") String id) {
        User user = userService.selectById(id);
        return Msg.success().add("user", user);
    }

    /**
     * 查询是不是有这个用户
     *
     * @param name
     * @return
     */
    @RequestMapping(value = "/checkUserName", method = RequestMethod.POST)
    @ResponseBody
    public String checkUserName(String name) {
        return "valid:" + userService.checkUserName(name);
    }

}
