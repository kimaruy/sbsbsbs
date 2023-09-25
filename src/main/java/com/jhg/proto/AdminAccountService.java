package com.jhg.proto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhg.proto.user.UserRepository;
import com.jhg.proto.user.SiteUser;
import com.jhg.proto.user.UserRole;

import java.util.Set;

@Service
public class AdminAccountService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AdminAccountService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void createAdminAccount() {
        // 아래 정보를 원하는 값으로 설정하여 어드민 계정을 생성합니다.
        String adminUsername = "admin";
        String adminPassword = "1111";

        // 이미 동일한 사용자명으로 계정이 존재하는지 확인
        if (!userRepository.existsByUsername(adminUsername)) {
            SiteUser adminUser = new SiteUser();
            adminUser.setUsername(adminUsername);
            adminUser.setPassword(passwordEncoder.encode(adminPassword)); // 패스워드를 암호화하여 저장
            adminUser.setAuthorities(Set.of(UserRole.ADMIN)); // 어드민 권한 부여

            // 다른 필요한 사용자 정보도 설정 가능

            userRepository.save(adminUser);
        }
    }
}