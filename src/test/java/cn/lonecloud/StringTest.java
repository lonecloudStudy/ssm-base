package cn.lonecloud;

import cn.lonecloud.utils.StringUtils;
import org.junit.Test;

/**
 * Created by lonecloud on 17/5/14.
 */
public class StringTest {

    @Test
    public void getPath(){
        String path = StringUtils.getPath();
        System.out.println(path);
        System.out.println(StringUtils.getWebPath());
    }
}
