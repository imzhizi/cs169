class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError;
  end

  def self.winner(player1, player2)
    if ['R', 'P', 'S'].include?(player1[1]) && ['R', 'P', 'S'].include?(player2[1])
      return player1 if player1[1] == player2[1]
      if player1[1] == "R"
        return player1 if player2[1] == "S"
        return player2
      end

      if player1[1] == "S"
        return player1 if player2[1] == "P"
        return player2
      end

      if player1[1] == "P"
        return player1 if player2[1] == "R"
        return player2
      end
    else
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].class == Array
      return winner tournament_winner(tournament[0]), tournament_winner(tournament[1])
    else
      return winner(tournament[0], tournament[1])
    end
  end

end
