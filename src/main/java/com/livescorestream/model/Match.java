package com.livescorestream.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Match {
    @Id
    @GeneratedValue
    private long match_id;

    @Column(nullable=false)
    private String team1_id;
    @Column(nullable=false)
    private String team2_id;
    private Date date;
    private String venue;
    private String matchType;

    // Constructors, getters, and setters


    public long getMatch_id() {
        return match_id;
    }

    public void setMatch_id(long match_id) {
        this.match_id = match_id;
    }

    public String getTeam1_id() {
        return team1_id;
    }

    public void setTeam1_id(String team1_id) {
        this.team1_id = team1_id;
    }

    public String getTeam2_id() {
        return team2_id;
    }

    public void setTeam2_id(String team2_id) {
        this.team2_id = team2_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getMatchType() {
        return matchType;
    }

    public void setMatchType(String matchType) {
        this.matchType = matchType;
    }
}
