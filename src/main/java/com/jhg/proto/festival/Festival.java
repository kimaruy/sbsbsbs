package com.jhg.proto.festival;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Festival {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "picture")
    private String picture;

    @Column(name = "title", length = 100)
    private String title;

    @Column(name = "event_Period")
    private String event_Period;

    @Column(name = "region")
    private String region;

    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "inquiry_call")
    private String inquiryCall;

    @Column(name = "site_link", columnDefinition = "TEXT")
    private String siteLink;

    @Column(name = "classification")
    private String classification;
}
