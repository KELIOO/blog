package com.mszlu.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.mszlu.blog.dao.mapper.zanMapper;
import com.mszlu.blog.dao.pojo.zan;
import com.mszlu.blog.service.zanService;
import com.mszlu.blog.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class zanServiceImpl implements zanService {
    @Autowired
    private zanMapper zanMapper;
    @Override
    public Result add() {
        LambdaQueryWrapper<zan>  QueryWrapper = new LambdaQueryWrapper<>();
        QueryWrapper.eq(zan::getId,1);
        zan zan = zanMapper.selectOne(QueryWrapper);
        zan.setCount(zan.getCount() + 1);
        zanMapper.updateById(zan);
        return Result.success(zan.getCount());
    }

    @Override
    public Result find() {
        LambdaQueryWrapper<zan>  QueryWrapper = new LambdaQueryWrapper<>();
        QueryWrapper.eq(zan::getId,1);
        zan zan = zanMapper.selectOne(QueryWrapper);
        return Result.success(zan.getCount());
    }
}
