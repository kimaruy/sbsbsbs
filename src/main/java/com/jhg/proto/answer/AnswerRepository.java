package com.jhg.proto.answer;

import com.jhg.proto.user.SiteUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AnswerRepository extends JpaRepository<Answer, Integer> {
    List<Answer> findByAuthorId(Long authorId);

    List<Answer> findByAuthor(SiteUser siteUser);
}