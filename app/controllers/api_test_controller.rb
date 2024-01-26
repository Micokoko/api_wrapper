# app/controllers/api_test_controller.rb

class ApiTestController < ApplicationController
  def index
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    @games = RawgWrapper.get_games(api_key)

    if @games
      render json: @games
    else
      render json: nil
    end
  end

  def show
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    title = params[:title] # Retrieve the title parameter from the request
    @game = RawgWrapper.get_games(api_key, { search: title })['results'].first
  
    if @game
      render json: @game
    else
      render json: { error: 'Game not found' }, status: :not_found
    end
  end
  
  def platforms_list
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    platforms_response = RawgWrapper.get_platforms(api_key)
    
    if platforms_response && platforms_response['results']
      platforms = platforms_response['results'].map do |platform|
        {
          name: platform['name'],
          games_count: platform['games_count']
        }
      end
      render json: platforms
    else
      render json: { error: 'Platforms list not found' }, status: :not_found
    end
  end
  
  

  def creators_list
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    creators_response = RawgWrapper.get_creators(api_key)
  
    if creators_response && creators_response['results']
      creators = creators_response['results'].map { |creator| creator['name'] }
      render json: creators
    else
      render json: { error: 'Creator list not found' }, status: :not_found
    end
  end
  
end
