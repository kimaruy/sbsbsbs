package com.jhg.proto;

import com.jhg.proto.question.QuestionService;
import com.jhg.proto.user.SiteUser;
import com.jhg.proto.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Random;

@Service
public class DB_Data_Set {

    private final UserService userService;
    private final QuestionService questionService;

    @Autowired
    public DB_Data_Set(UserService userService, QuestionService questionService) {
        this.userService = userService;
        this.questionService = questionService;
    }

    @PostConstruct
    public void initializeData() {
        // Insert admin user
        userService.create("admin", "admin", "admin@admin.com", "관리자", "program_manager", "0000-00-00", "KT", "010-0000-0000");

        // Insert user1
        SiteUser user1 = userService.create("user1", "user1", "user1@user1.com", "user1name", "user1nickname", "1111-11-11", "KT", "010-1111-1111");

        // boardId 1, 2, 3에 대해 13개의 데이터 생성
        Random random = new Random();
        for (int boardId = 1; boardId <= 6; boardId++) {
            for (int i = 1; i <= 13; i++) {
                String subject = generateRandomSubject(boardId, i);
                String content = generateRandomContent(boardId, i);

                // create 메서드를 호출하여 데이터 생성
                questionService.create(subject, content, user1, boardId);
            }
        }
    }

    // 동적으로 번호를 붙여주는 제목 생성
    private String generateRandomSubject(int boardId, int number) {
        String prefix = getBoardPrefix(boardId);
        return prefix + " 제목 " + number;
    }

    // 동적으로 번호를 붙여주는 내용 생성
    private String generateRandomContent(int boardId, int number) {
        String prefix = getBoardPrefix(boardId);
        return prefix + " 내용 " + number;
    }

    // boardId에 따라 접두사를 반환
    private String getBoardPrefix(int boardId) {
        if (boardId == 1) {
            return "[리뷰] ";
        } else if (boardId == 2) {
            return "[자유] ";
        } else if (boardId == 3) {
            return "[Q&A] ";
        } else if (boardId == 4) {
            return "[공지] ";
        } else if (boardId == 5) {
            return "[제휴] ";
        } else if (boardId == 6) {
            return "[신고] ";
        } else {
            return "기타";
        }
    }


}
