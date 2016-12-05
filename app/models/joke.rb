class Joke < ApplicationRecord
  validates :joke, presence: true

  def self.find_random_joke
    jokes_not_shown = Joke.where(is_shown: false)
    return jokes_not_shown.limit(1).offset(rand(jokes_not_shown.count)).first
  end

  def self.refresh_all
    jokes_shown = Joke.where(is_shown:true)
    jokes_shown.update_all(is_shown: false)
  end
end
