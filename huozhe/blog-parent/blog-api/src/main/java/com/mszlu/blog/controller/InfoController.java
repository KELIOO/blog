package com.mszlu.blog.controller;

import com.mszlu.blog.dao.pojo.SysUser;
import com.mszlu.blog.service.SysUserService;
import com.mszlu.blog.vo.Result;
import com.mszlu.blog.vo.params.InfoParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private SysUserService sysUserService;


    @GetMapping("getInfo/{account}")
    public Result getInfo(@PathVariable("account") String account){
        SysUser user = sysUserService.findUserByAccount(account);
        System.out.println("=========================="+user.getId());
        return Result.success(user);
    }

    @PostMapping
    public Result pushChangeInfo(@RequestBody InfoParam infoParam){
        return sysUserService.changeInfo(infoParam);
    }
}
