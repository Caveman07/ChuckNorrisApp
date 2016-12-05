class JokesController < ApplicationController
  def index
    @jokes = Joke.all.order('updated_at DESC')
  end
end
