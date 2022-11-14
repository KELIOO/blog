package com.mszlu.blog.controller;

import com.mszlu.blog.service.zanService;
import com.mszlu.blog.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 点赞加1
 */
@RestController
@RequestMapping("Zan")
public class addZan {

    @Autowired
    private zanService zanService;
    @RequestMapping("add")
    public Result addZan() {
        return zanService.add();
    }

    @RequestMapping("find")
    public Result findZan() {
        return zanService.find();
    }
}
