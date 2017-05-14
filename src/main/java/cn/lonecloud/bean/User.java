package cn.lonecloud.bean;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
import java.util.Date;

public class User {

    private String id;

    @Pattern(regexp = "[\\u4e00-\\u9fa5_a-zA-Z0-9_]{4,10}",message = "用户名错误")
    private String name;


    private String sex;
    @Email
    private String email;


    private String tId;

    private Department department;

    private Date createTime;


    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }


    public void setSex(String sex) {
        this.sex = sex;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String gettId() {
        return tId;
    }


    public void settId(String tId) {
        this.tId = tId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}