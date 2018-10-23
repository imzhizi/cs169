class Movie < ApplicationRecord
  def self.all_ratings
    %w(G P PG-13 NC-17 R)
  end
end
