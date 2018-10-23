module FunWithStrings
  def palindrome?
    str = self.downcase.gsub(/[^a-z]/i, '')
    str.eql? str.reverse
  end

  def count_words
    map = {}
    self.downcase.gsub(/[^a-z]/i, ' ').split.each do |e|
      if (map.has_key? e)
        map[e] = map[e] + 1
      else
        map[e] = 1
      end
    end
    return map
  end

  def anagram_groups
    self.downcase.split.group_by {|word| word.chars.sort}.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

# 'now is the time'.count_words