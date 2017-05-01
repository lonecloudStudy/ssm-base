package cn.lonecloud.listener;

import cn.lonecloud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by lonecloud on 17/5/1.
 * department的监听类
 */
public class DepartmentListener implements ServletContextListener{

    DepartmentService departmentService;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        WebApplicationContext context= WebApplicationContextUtils.getWebApplicationContext(servletContext);
        departmentService = context.getBean(DepartmentService.class);
        servletContext.setAttribute("departments", this.departmentService.getAllDept());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
