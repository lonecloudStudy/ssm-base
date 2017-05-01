package cn.lonecloud.dto;

import cn.lonecloud.cts.MessageConstants;
import cn.lonecloud.cts.MsgConstants;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by lonecloud on 17/4/30.
 * 消息和数据传递类
 */
public class Msg {

    private MessageConstants code;

    private String message;

    private Map<String, Object> data = new HashMap<String, Object>();

    public MessageConstants getCode() {
        return code;
    }

    public void setCode(MessageConstants code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public Msg(MessageConstants code, String message) {
        this.code = code;
        this.message = message;
    }

    /**
     * 返回成功信息
     * @return
     */
    public static Msg success() {
        return new Msg(MessageConstants.SUCCESS, MsgConstants.SUCCESS);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static Msg error() {
        return new Msg(MessageConstants.ERROR, MsgConstants.ERROR);
    }

    /**
     * 循环添加
     * @param key
     * @param value
     * @return
     */
    public Msg add(String key,Object value){
        this.data.put(key,value);
        return this;
    }

}
