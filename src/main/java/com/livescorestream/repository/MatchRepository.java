package com.livescorestream.repository;

import com.livescorestream.model.Match;
import org.springframework.data.jpa.repository.JpaRepository; // Import correct interface

public interface MatchRepository extends JpaRepository<Match, Long> {
    // Add custom query methods if needed
}
