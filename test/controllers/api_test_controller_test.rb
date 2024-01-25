# app/controllers/api_test_controller.rb

class ApiTestController < ApplicationController
  def index
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    @games = RawgWrapper.get_games(api_key)
  end

  def show
    api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'
    title = 'valorant'

    @game = RawgWrapper.get_games(api_key, { search: title })['results'].first
  end
end
