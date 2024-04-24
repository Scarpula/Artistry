package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
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