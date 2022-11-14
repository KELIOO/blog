package com.mszlu.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mszlu.blog.dao.mapper.messageBoardMapper;
import com.mszlu.blog.dao.pojo.messageBoard;
import com.mszlu.blog.service.messageBoardService;
import com.mszlu.blog.vo.Result;
import com.mszlu.blog.vo.params.messageParams;
import org.joda.time.format.FormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;


@Service
public class messageBoardServiceImpl implements messageBoardService {

    @Autowired
    private messageBoardMapper messageBoardMapper;
    @Override
    public Result addMessage(messageParams message) {
        messageBoard messageBoard = new messageBoard();
        messageBoard.setNickname(message.getNickname());
        messageBoard.setContent(message.getContent());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd' 'HH:mm:ss");
        String format = simpleDateFormat.format(new Date());
        messageBoard.setCreateDate(format);
        int i = messageBoardMapper.insert(messageBoard);
        if(i>0){
            return Result.success(null);
        }
        return Result.fail(500,null);
    }

    @Override
    public Result showList(Integer currentPage, Integer size) {
        IPage<messageBoard> boardPage = new Page<>(currentPage, size);
        boardPage = messageBoardMapper.selectPage(boardPage, null);
        return Result.success(boardPage.getRecords());
    }

    @Override
    public Result showLists() {
        LambdaQueryWrapper<messageBoard> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(messageBoard::getCreateDate);
        List<messageBoard> messageBoardList = messageBoardMapper.selectList(queryWrapper);
        return Result.success(messageBoardList);
    }

    @Override
    public Result deleteMessage(Integer id) {
        LambdaQueryWrapper<messageBoard> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(messageBoard::getId,id);
        return messageBoardMapper.delete(queryWrapper) > 0 ? Result.success("删除成功！") : Result.fail(500,"删除失败！");
    }
}
