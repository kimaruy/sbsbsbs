package com.jhg.proto;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/map")
@Controller
@RequiredArgsConstructor
public class KakaoMap {

    @GetMapping("/restaurant")
    public String showRestaurant() {
        return "kakaomap_restaurant";
    }

    @GetMapping("/lodging")
    public String showLodging() {
        return "kakaomap_lodging";
    }
}
