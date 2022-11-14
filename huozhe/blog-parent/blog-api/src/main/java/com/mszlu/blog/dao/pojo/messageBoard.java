package com.mszlu.blog.dao.pojo;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class messageBoard {
    @TableId(type = IdType.AUTO)
    private Long id;

    private String nickname;

    private String content;

    private String createDate;
}
