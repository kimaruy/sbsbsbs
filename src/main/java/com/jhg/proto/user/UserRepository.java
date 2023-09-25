package com.jhg.proto.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<SiteUser, Long> {
    Optional<SiteUser> findByusername(String username);

    boolean existsByUsername(String username); // 회원 가입시 아이디 체크
}