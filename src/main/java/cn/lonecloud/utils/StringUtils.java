package cn.lonecloud.utils;

import java.util.UUID;

/**
 * Created by lonecloud on 17/4/30.
 */
public class StringUtils {

    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

}
