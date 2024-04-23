package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverUser {
    private Long id;
    private String name;
    private String email;
    private String nickname;
    private String profileImg;
    private String gender;
    private String birthday;
    private String age;
    private String birthyear;
    private String mobile;
}