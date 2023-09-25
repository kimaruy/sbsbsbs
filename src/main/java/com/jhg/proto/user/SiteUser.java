package com.jhg.proto.user;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
@Entity
public class SiteUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 이 부분이 login ID 입니다.
    @Column(unique = true)
    private String username;

    private String password;

    @Column(unique = true)
    private String email;

    private String name;

    @Column(unique = true)
    private String nickname;

    private String birthdate;

    private String telecom;

    @Column(unique = true)
    private String phone;

    @ManyToMany
    Set<SiteUser> voter;

    @ManyToOne
    private SiteUser author;

    @Enumerated(EnumType.STRING)
    @ElementCollection(fetch = FetchType.EAGER)
    private Set<UserRole> authorities;

    public boolean hasRole(UserRole role) {
        return authorities.contains(role);
    }

    public boolean isAdmin() {
        return hasRole(UserRole.ADMIN);
    }

}
