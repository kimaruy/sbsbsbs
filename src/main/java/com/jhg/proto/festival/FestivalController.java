package com.jhg.proto.festival;

import com.jhg.proto.answer.AnswerForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/festival")
@Controller
@RequiredArgsConstructor
public class FestivalController {
    private final FestivalService festivalService;
    private final FestivalRepository festivalRepository;

    @GetMapping("/list")
    public String showFestivalList(Model model) {
        int pageSize = 12; // 한 페이지에 표시할 항목 수를 12로 고정합니다.
        int pageNumber = 1; // 현재 페이지 번호를 지정합니다. 초기 페이지는 1로 설정합니다.

        List<Festival> festivals = festivalService.getListByPage(pageNumber, pageSize);
        int totalFestivalCount = festivalService.getTotalCount(); // 전체 축제 항목 수를 가져옵니다.

        int totalPages = (int) Math.ceil((double) totalFestivalCount / pageSize); // 전체 페이지 수를 계산합니다.

        model.addAttribute("festivals", festivals);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", pageSize); // 페이지 크기를 모델에 추가합니다.

        return "festival_list"; // 템플릿 파일 이름은 "festival_list.html"로 일치해야 합니다.
    }

    // 다음과 이전 페이지로 이동하기 위한 메서드
    @GetMapping("/list/page/{pageNumber}")
    public String showFestivalListByPage(Model model, @PathVariable("pageNumber") Integer pageNumber) {
        int pageSize = 12;

        List<Festival> festivals = festivalService.getListByPage(pageNumber, pageSize);
        int totalFestivalCount = festivalService.getTotalCount();
        int totalPages = (int) Math.ceil((double) totalFestivalCount / pageSize);

        model.addAttribute("festivals", festivals);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("totalPages", totalPages);

        return "festival_list";
    }

    @GetMapping("/detail/{id}")
    public String showFestivalDetail(Model model, @PathVariable("id") Integer id) {
        Festival selectedFestival = festivalService.getFestivalById(id);
        if (selectedFestival != null) {
            model.addAttribute("selectedFestival", selectedFestival);
            return "festival_detail"; // 템플릿 파일 이름은 "festival_detail.html"로 일치해야 합니다.
        } else {
            return "error"; // 축제가 없는 경우 예외 처리
        }
    }
}