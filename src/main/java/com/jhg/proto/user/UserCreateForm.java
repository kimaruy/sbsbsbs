package com.jhg.proto.user;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateForm {
    @Size(min = 3, max = 25)
    @NotEmpty(message = "사용자 ID는 필수 항목 입니다.")
    private String username;

    @NotEmpty(message = "비밀번호는 필수 항목 입니다.")
    private String password1;

    @NotEmpty(message = "비밀번호 확인은 필수 항목 입니다.")
    private String password2;

    @NotEmpty(message = "이메일은 필수 항목 입니다.")
    @Email
    private String email;

    @NotEmpty(message = "이름은 필수 항목 입니다.")
    private String name;

    @NotEmpty(message = "닉네임은 필수 항목 입니다.")
    private String nickname;

    @NotEmpty(message = "생년월일은 필수 항목 입니다.")
    private String birthdate;

    @NotEmpty(message = "통신사는 필수 항목 입니다.")
    private String telecom; // 통신사 필드 추가

    @NotEmpty(message = "전화번호는 필수 항목 입니다.")
    private String phone;

}
