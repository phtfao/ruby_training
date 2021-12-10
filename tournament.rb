## Let’s create a football tournament with 4 teams playing against each other. 
# Each team should have a name and all the teams will play matches against each other. 
# If a team wins the match, it receives 3 points, if it ties it receives 1 point and if it loses, it receives no point. 
# Below are the scores for the tournament.
# Team A 3 x 1 Team B
# Team C 0 x 0 Team D
# . . .
# Create a program that receives these match results and displays the final tournament standings table in order 
# (first team with the most points received; last team with the least points received).

class Team
  attr_accessor :name, :points

  def initialize(name)
    @name = name
    @points = 0
  end

  def increase_points(points)
    @points += points
  end
end

class Match
    attr_accessor :team_a, :team_b, :score_team_a, :score_team_b
    WIN_POINTS = 3
    TIE_POINTS = 1

    def initialize(team_a, team_b)
        @team_a = team_a
        @team_b = team_b
        @score_team_a = 0
        @score_team_b = 0
    end

    def set_result(score_team_a, score_team_b)
        @score_team_a = score_team_a
        @score_team_b = score_team_b

        calculate_points
    end

    def calculate_points
        if @score_team_a > @score_team_b
            @team_a.increase_points WIN_POINTS
        elsif @score_team_a < @score_team_b
            @team_b.increase_points WIN_POINTS
        else
            @team_a.increase_points TIE_POINTS
            @team_b.increase_points TIE_POINTS
        end
    end
end

class Tournament
    attr_accessor :teams
  
    def initialize
        @teams = []
    end

    def add_team(team)
        @teams << team
    end

    def print_standings
        @teams.sort! { |a, b| a.points <=> b.points }.reverse!
        @teams.each { |team| puts "#{team.name} .......... #{team.points} points" }
    end
end

football_tournament = Tournament.new

team_a = Team.new('Team A')
team_b = Team.new('Team B')
team_c = Team.new('Team C')
team_d = Team.new('Team D')

match_1 = Match.new(team_a, team_b)
match_1.set_result(3, 1)

match_2 = Match.new(team_c, team_d)
match_2.set_result(0, 0)

match_3 = Match.new(team_a, team_c)
match_3.set_result(1, 1)

match_4 = Match.new(team_b, team_d)
match_4.set_result(2, 3)

match_5 = Match.new(team_a, team_d)
match_5.set_result(2, 1)

match_6 = Match.new(team_b, team_c)
match_6.set_result(3, 1)

football_tournament.add_team(team_a)
football_tournament.add_team(team_b)
football_tournament.add_team(team_c)
football_tournament.add_team(team_d)

football_tournament.print_standings