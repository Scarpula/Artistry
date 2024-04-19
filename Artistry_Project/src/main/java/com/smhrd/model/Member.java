package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

// @Data: 만능 - 기본 생성자, getter, setter, toString...
@AllArgsConstructor // 모든 파라미터를 받는 생성자
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor // 필요한 파라미터를 받는 생성자
@Getter
@Setter
public class Member {
   @NonNull
   private String mb_Email;
   @NonNull
   private String mb_Pw;
   @NonNull
   private String mb_Phone;
   @NonNull
   private String mb_Birthdate;
   @NonNull
   private String mb_Name;
   @NonNull
   private String mb_Nick;

   private String mb_ProfileImg;
   @NonNull
   private String mb_Addr;
   
   @NonNull
   private Boolean mb_Type;
   
   
   public Member(@NonNull String mb_Email, @NonNull String mb_Pw) {
      super();
      this.mb_Email = mb_Email;
      this.mb_Pw = mb_Pw;
   }

}