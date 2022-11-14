package com.mszlu.blog.service;

import com.mszlu.blog.vo.Result;
import com.mszlu.blog.vo.params.messageParams;

public interface messageBoardService {
    Result addMessage(messageParams message);

    Result showList(Integer currentPage, Integer size);

    Result showLists();

    Result deleteMessage(Integer id);
}
