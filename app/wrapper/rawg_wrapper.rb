# app/wrappers/rawg_wrapper.rb

class RawgWrapper
  include HTTParty
  base_uri 'https://api.rawg.io/api'
  api_key = 'cb33a3ede2724c39a3fed84b3ec99a94'

  def self.get_games(api_key, options = {})
    query_params = { key: api_key }.merge(options)
    get('/games', query: query_params)
  end

  def self.get_game(id, api_key)
    get("/games/#{id}", query: { key: api_key })
  end


  def self.get_platforms(api_key, options = {})
    query_params = { key: api_key }.merge(options)
    get('/platforms', query: query_params)
  end

  
  def self.get_creators(api_key, options = {})
    query_params = { key: api_key }.merge(options)
    get('/creators', query: query_params)
  end


end
