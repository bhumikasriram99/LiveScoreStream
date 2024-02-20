package com.livescorestream.service;

import com.livescorestream.model.Match;
import com.livescorestream.repository.MatchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MatchService {

    @Autowired
    private MatchRepository matchRepository;

    public List<Match> getAllMatches() {
        return matchRepository.findAll();
    }

    public Optional<Match> getMatchById(Long id) {
        return matchRepository.findById(id);
    }

    public Match createMatch(Match match) {
        return matchRepository.save(match);
    }

    public Match updateMatch(Long id, Match matchDetails) {
        Match match = matchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Match not found"));

        match.setTeam1_id(matchDetails.getTeam1_id());
        match.setTeam2_id(matchDetails.getTeam2_id());
        match.setDate(matchDetails.getDate());
        match.setVenue(matchDetails.getVenue());
        match.setMatchType(matchDetails.getMatchType());

        return matchRepository.save(match);
    }

    public void deleteMatch(Long id) {
        matchRepository.deleteById(id);
    }
}
