package com.jhg.proto.festival;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FestivalRepository extends JpaRepository<Festival, Integer> {
    List<Festival> findAll();
}
