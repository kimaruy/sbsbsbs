package com.jhg.proto.question;

import com.jhg.proto.answer.Answer;
import com.jhg.proto.user.SiteUser;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity // 이 클래스가 JPA 엔티티임을 나타냅니다.
public class Question {
    @Id // Primary key 열임을 나타냅니다.
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 자동 생성되는(primary key) 값임을 나타냅니다.
    private Integer id;

    @Column(length = 200) // VARCHAR(200) 형식의 열을 나타냅니다.
    private String subject;

    @Column(columnDefinition = "TEXT") // TEXT 형식의 열을 나타냅니다.
    private String content;

    private LocalDateTime createDate; // 질문의 생성 일자 및 시간을 저장합니다.

    // mappedBy: Answer 클래스의 'question' 변수에 대응하는 필드명을 나타냅니다.
    // CascadeType.REMOVE를 사용하면 Question을 삭제할 때 해당하는 답변도 함께 삭제됩니다.
    // OneToMany 어노테이션은 테이블의 칼럼으로 생성되지 않고, 엔티티 간의 관계를 표시합니다.
    @OneToMany(mappedBy = "question", cascade = CascadeType.REMOVE)
    private List<Answer> answerList; // 하나의 질문에 대한 여러 답변을 나타냅니다.

    @ManyToOne // ManyToOne 관계를 표시합니다.
    private SiteUser author; // 질문의 작성자를 나타냅니다.

    private LocalDateTime modifyDate; // 질문의 수정 일자 및 시간을 저장합니다.

    @ManyToMany // ManyToMany 관계를 표시합니다.
    Set<SiteUser> voter; // 질문에 투표한 사용자 목록을 나타냅니다.

    @Column
    private Integer boardId; // 게시판 정보를 나타냅니다.

}
