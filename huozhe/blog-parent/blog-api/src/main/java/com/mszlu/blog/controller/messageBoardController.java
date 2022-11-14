package com.mszlu.blog.controller;


import com.mszlu.blog.service.messageBoardService;
import com.mszlu.blog.vo.Result;

import com.mszlu.blog.vo.params.messageParams;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("message")
@RestController
public class messageBoardController {

    @Autowired
    private messageBoardService messageService;

    @RequestMapping("/add")
    public Result message(@RequestBody messageParams message) {
        return messageService.addMessage(message);
    }

    @RequestMapping("/list/{page}/{pageSize}")
    public Result messageList(@PathVariable("page") Integer page,@PathVariable("pageSize") Integer pageSize) {
        return messageService.showList(page, pageSize);
    }
    @RequestMapping("/lists")
    public Result messageLists() {
        return messageService.showLists();
    }
    @RequestMapping("/delete/{id}")
    public Result deleteMessage(@PathVariable("id") Integer id){
        return messageService.deleteMessage(id);
    }
}
