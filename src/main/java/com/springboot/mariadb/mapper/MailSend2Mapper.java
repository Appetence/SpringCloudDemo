package com.springboot.mariadb.mapper;

import com.springboot.mariadb.entity.MailSend;
import com.springboot.mariadb.entity.MailSendExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MailSend2Mapper {
    long countByExample(MailSendExample example);

    int deleteByExample(MailSendExample example);

    int deleteByPrimaryKey(String sendId);

    int insert(MailSend record);

    int insertSelective(MailSend record);

    List<MailSend> selectByExample(MailSendExample example);

    MailSend selectByPrimaryKey(String sendId);

    int updateByExampleSelective(@Param("record") MailSend record, @Param("example") MailSendExample example);

    int updateByExample(@Param("record") MailSend record, @Param("example") MailSendExample example);

    int updateByPrimaryKeySelective(MailSend record);

    int updateByPrimaryKey(MailSend record);
}