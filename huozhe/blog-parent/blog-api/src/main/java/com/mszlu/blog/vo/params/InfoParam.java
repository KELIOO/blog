package com.mszlu.blog.vo.params;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class InfoParam {
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;
    private String account;
    private String avatar;
    private String email;
    private String mobilePhoneNumber;
    private String nickname;
}
