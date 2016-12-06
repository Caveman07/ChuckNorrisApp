class JokesController < ApplicationController

  def index
    @jokes = Joke.where(is_shown: true).order('updated_at DESC')
      respond_to do |format|
        format.html
        format.js
      end
  end

  def fetch_new_record
    @random_joke = Joke.find_random_joke
        respond_to do |format|
            if @random_joke.update_attributes(is_shown: true)
              format.html { redirect_to jokes_path, notice: 'fetched new' }
              format.js { @random_joke }
            end
        end
  end

  def refresh
    Joke.refresh_all
      respond_to do |format|
          format.html { redirect_to jokes_path, notice: 'refreshed' }
      end
  end

end
