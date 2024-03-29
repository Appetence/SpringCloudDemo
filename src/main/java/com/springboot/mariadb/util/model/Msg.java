package com.springboot.mariadb.util.model;


import java.io.Serializable;

import com.alibaba.fastjson.JSON;

/**   
 * @ClassName:  Msg   
 * @Description:统一前端以后台交互的方式
 * @author: jxZhang
 * @date:   2019年3月12日 下午2:15:34   
 *   
 */
public class Msg implements Serializable {
    private static final long serialVersionUID = -1L;

    private int result;//小于0是操作失败，等于大于0是操作成功
    private String message;//提示语
    private Object data;//操作结果

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result=result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message=message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data=data;
    }

    public String toJson() {
        return JSON.toJSONString(this);
    }
}
