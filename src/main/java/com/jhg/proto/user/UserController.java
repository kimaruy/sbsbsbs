package com.jhg.proto.user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/signup")
    public String signup(UserCreateForm userCreateForm) {
        return "signup_form";
    }

    @PostMapping("/signup")
    public String signup(@Valid UserCreateForm userCreateForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "signup_form";
        }

        if (!userCreateForm.getPassword1().equals(userCreateForm.getPassword2())) {
            bindingResult.rejectValue("password2", "passwordInCorrect",
                    "2개의 패스워드가 일치하지 않습니다.");
            return "signup_form";
        }

        try {
            userService.create(userCreateForm.getUsername(),
                    userCreateForm.getPassword1(), userCreateForm.getEmail(),
                    userCreateForm.getName(), userCreateForm.getNickname(),
                    userCreateForm.getBirthdate(), userCreateForm.getTelecom(),
                    userCreateForm.getPhone());
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", "이미 등록된 사용자입니다.");
            return "signup_form";
        } catch (Exception e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", e.getMessage());
            return "signup_form";
        }

        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "login_form";
    }

    @PostMapping("/login")
    public String loginSuccess() {
        // 로그인 성공 시 처리
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout() {
        // 로그아웃 처리
        return "redirect:/";
    }

    @GetMapping("/center_list")
    public String center_list() {
        return "center_list";
    }

    // 마이페이지
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/mypage")
    public String mypage(Principal principal, Model model) {
        SiteUser siteUser = this.userService.getUser(principal.getName());
        model.addAttribute("siteUser", siteUser);
        return "mypage_form";
    }
    // 마이페이지 탈퇴 페이지
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/mypage_withdrawal")
    public String mypage_exit(Principal principal, Model model) {
        SiteUser siteUser = this.userService.getUser(principal.getName());
        model.addAttribute("siteUser", siteUser);
        return "mypage_withdrawal";
    }
    // 마이페이지 수정
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/mypage_information")
    public String mypage_information(Principal principal, Model model) {
        SiteUser siteUser = this.userService.getUser(principal.getName());
        model.addAttribute("siteUser", siteUser);
        return "mypage_information";
    }

    // 아이디 중복 체크
    @GetMapping("/checkUsername/{username}")
    public ResponseEntity<?> checkUsernameAvailability(@PathVariable String username) {
        // 아이디 중복 체크를 위한 서비스 메서드 호출
        boolean isUsernameAvailable = !userRepository.existsByUsername(username);
        Map<String, Boolean> response = new HashMap<>();
        response.put("available", isUsernameAvailable);
        return ResponseEntity.ok(response);
    }

    // 수정된 부분: 프로필 업데이트 핸들러 추가
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute SiteUser updatedUser, Principal principal, Model model) {
        try {
            // 현재 사용자 가져오기
            SiteUser currentUser = userService.getUser(principal.getName());

            // 업데이트 사용자 정보 설정
            currentUser.setNickname(updatedUser.getNickname());
            currentUser.setPhone(updatedUser.getPhone());
            currentUser.setEmail(updatedUser.getEmail());

            // 사용자 정보 업데이트
            userService.updateUser(currentUser);

            // 업데이트 후, 다시 마이페이지로 리다이렉트
            return "redirect:/user/mypage";
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            // 데이터 무결성 예외 처리 (예: 중복 값 처리)
            model.addAttribute("updateError", "이미 등록된 사용자입니다.");
            return "mypage_information"; // 에러 페이지로 리다이렉트
        } catch (UsernameNotFoundException e) {
            e.printStackTrace();
            // 사용자를 찾을 수 없음 예외 처리
            model.addAttribute("updateError", "사용자를 찾을 수 없습니다.");
            return "mypage_information"; // 에러 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();
            // 기타 예외 처리
            model.addAttribute("updateError", "업데이트 중 오류가 발생했습니다.");
            return "mypage_information"; // 에러 페이지로 리다이렉트
        }
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/mypage_withdrawal")
    public String userDelete(HttpServletRequest request, @RequestParam("password") String password,
                             HttpServletResponse response, Principal principal, RedirectAttributes attributes) {
        SiteUser siteUser = this.userService.getUser(principal.getName());

        if (BCrypt.checkpw(password, siteUser.getPassword())) {
            this.userService.delete(siteUser);

            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null) {
                new SecurityContextLogoutHandler().logout(request, response, auth);
            }

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            return "redirect:/"; // 메인 페이지로 리다이렉트
        } else {
            // 비밀번호가 일치하지 않을 때 오류 메시지를 전달하고 회원 탈퇴 페이지로 리다이렉트합니다.
            attributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
            return "redirect:/user/mypage_withdrawal";
        }
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/password_modify")
    public String showChangePasswordForm(Model model) {
        return "password_modify";
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/password_modify")
    public String changePassword(@RequestParam("password") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword,
                                 Model model, Principal principal) {
        String username = principal.getName();

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            return "password_modify";
        }

        if (!userService.isCorrectPassword(username, currentPassword)) {
            model.addAttribute("error", "기존 비밀번호가 올바르지 않습니다.");
            return "password_modify";
        }

        userService.updatePassword(username, newPassword);

        return "redirect:/user/mypage";
    }
}