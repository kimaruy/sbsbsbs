package com.jhg.proto.question;

import com.jhg.proto.answer.AnswerForm;
import com.jhg.proto.user.SiteUser;
import com.jhg.proto.user.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;

@RequestMapping("/question")
@RequiredArgsConstructor
@Controller
public class QuestionController {

    private final QuestionService questionService;
    private final UserService userService;

    // 자유 게시판 = boardId = 2
    @GetMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "page", defaultValue = "0") int page,
                       @RequestParam(value = "kw", defaultValue = "") String kw,
                       @RequestParam(value = "boardId", defaultValue = "2") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "question_list";
    }

    @GetMapping(value = "/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id, AnswerForm answerForm) {
        Question question = this.questionService.getQuestion(id);
        model.addAttribute("question", question);
        return "question_detail";
    }

    // 질문 등록 페이지로 이동
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/create")
    public String questionCreate(QuestionForm questionForm) {
        return "question_form";
    }
    // 질문 등록 처리
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/create")
    public String questionCreate(
            @Valid QuestionForm questionForm,
            BindingResult bindingResult,
            Principal principal,
            @RequestParam("board") Integer boardId
    ) {
        if (bindingResult.hasErrors()) {
            return "question_form";
        }

        SiteUser siteUser = this.userService.getUser(principal.getName());
        this.questionService.create(questionForm.getSubject(), questionForm.getContent(), siteUser, boardId);

        return "redirect:/question/qna_list";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/modify/{id}")
    public String questionModify(QuestionForm questionForm, @PathVariable("id") Integer id, Principal principal) {
        Question question = this.questionService.getQuestion(id);
        if(!question.getAuthor().getUsername().equals(principal.getName())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "수정권한이 없습니다.");
        }
        questionForm.setSubject(question.getSubject());
        questionForm.setContent(question.getContent());
        return "question_form";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/modify/{id}")
    public String questionModify(@Valid QuestionForm questionForm, BindingResult bindingResult,
                                 Principal principal, @PathVariable("id") Integer id) {
        if (bindingResult.hasErrors()) {
            return "question_form";
        }
        Question question = this.questionService.getQuestion(id);
        if (!question.getAuthor().getUsername().equals(principal.getName())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "수정권한이 없습니다.");
        }
        this.questionService.modify(question, questionForm.getSubject(), questionForm.getContent());
        return String.format("redirect:/question/detail/%s", id);
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/delete/{id}")
    public String questionDelete(Principal principal, @PathVariable("id") Integer id) {
        Question question = this.questionService.getQuestion(id);
        if (!question.getAuthor().getUsername().equals(principal.getName())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "삭제권한이 없습니다.");
        }
        this.questionService.delete(question);
        return "redirect:/";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/vote/{id}")
    public String questionVote(Principal principal, @PathVariable("id") Integer id) {
        Question question = this.questionService.getQuestion(id);
        SiteUser siteUser = this.userService.getUser(principal.getName());
        this.questionService.vote(question, siteUser);
        return String.format("redirect:/question/detail/%s", id);
    }

    // 리뷰 게시판 = boardId = 1
    @GetMapping("/reply_list")
    public String reply_list(Model model,
                             @RequestParam(value = "page", defaultValue = "0") int page,
                             @RequestParam(value = "kw", defaultValue = "") String kw,
                             @RequestParam(value = "boardId", defaultValue = "1") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "question_reply_list";
    }

    // qna 게시판 = boardId = 3
    @GetMapping("/qna_list")
    public String qna_list(Model model,
                           @RequestParam(value = "page", defaultValue = "0") int page,
                           @RequestParam(value = "kw", defaultValue = "") String kw,
                           @RequestParam(value = "boardId", defaultValue = "3") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "question_qna_list";
    }
    // 공지 사항 게시판 = boardId = 4
    @GetMapping("/notification_list")
    public String notification_list(Model model,
                                    @RequestParam(value = "page", defaultValue = "0") int page,
                                    @RequestParam(value = "kw", defaultValue = "") String kw,
                                    @RequestParam(value = "boardId", defaultValue = "4") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "question_notification_list";
    }

    @GetMapping("/affiliate")
    public String affiliate_list(Model model,
                                    @RequestParam(value = "page", defaultValue = "0") int page,
                                    @RequestParam(value = "kw", defaultValue = "") String kw,
                                    @RequestParam(value = "boardId", defaultValue = "5") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "affiliate";
    }

    @GetMapping("/report")
    public String report_list(Model model,
                                 @RequestParam(value = "page", defaultValue = "0") int page,
                                 @RequestParam(value = "kw", defaultValue = "") String kw,
                                 @RequestParam(value = "boardId", defaultValue = "6") Integer boardId) {
        Page<Question> paging = this.questionService.getList(page, kw, boardId);
        model.addAttribute("paging", paging);
        model.addAttribute("kw", kw);
        return "report";
    }
}