class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor 'word'
  attr_accessor 'guesses'
  attr_accessor 'wrong_guesses'

  def guess letter
    begin
      raise ArgumentError if (letter == nil) || (letter.eql? '') || (letter =~ /[^a-zA-Z]/i)


      if word.include? letter.downcase

        if guesses.include? letter.downcase
          "You have already used that letter."
        else
          @guesses += letter
          "Good shot"
        end

      else

        if wrong_guesses.include? letter.downcase
          "You have already used that letter."
        else
          @wrong_guesses += letter
          "Keep trying"
        end

      end
    rescue
      "Invalid guess."
    end
  end

  def word_with_guesses
    @guesses == '' ? (@word.gsub /[a-zA-Z]/i, '-') : (@word.gsub /[^#{@guesses}]/i, '-')
  end

  def check_win_or_lose
    if @wrong_guesses.length == 7
      :lose
    elsif @guesses.length == 0 || !(@word =~ /^([#{@guesses}]*)$/i)
      :play
    else
      :win
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start {|http|
      return http.post(uri, "").body
    }
  end


end
