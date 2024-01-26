## Rawg API Wrapper - Ruby on Rails App

This Ruby on Rails application serves as an API wrapper for the Rawg API, enabling users to retrieve information about games, platforms, and creators seamlessly.

### Controllers

#### `ApiTestController` (`app/controllers/api_test_controller.rb`)

- **Index Action:** Retrieves a list of games from the Rawg API.
- **Show Action:** Retrieves details of a specific game based on the provided title.
- **Platforms List Action:** Retrieves a list of platforms available on Rawg.
- **Creators List Action:** Retrieves a list of creators from the Rawg API.

### Routes

```ruby
Rails.application.routes.draw do
  root 'api_test#index'
  
  get '/api_test/index', to: 'api_test#index' 
  get '/api_test/platforms_list', to: 'api_test#platforms_list'
  get '/api_test/show/:title', to: 'api_test#show', as: 'api_test_show'
  get '/api_test/creators_list', to: 'api_test#creators_list'
end
```

### Wrapper Class

#### `RawgWrapper` (`app/wrappers/rawg_wrapper.rb`)

This class utilizes the `HTTParty` gem to facilitate HTTP requests to the Rawg API.

- **Functionality:** Provides methods to interact with the Rawg API.
- **Endpoints:**
  - `get_games`: Retrieves a list of games.
  - `get_game`: Retrieves details of a specific game.
  - `get_platforms`: Retrieves a list of platforms.
  - `get_creators`: Retrieves a list of creators.

### Usage

1. **Installation:**

   Ensure the `httparty` gem is included in your Gemfile:

   ```ruby
   gem 'httparty'
   ```

   Run `bundle install` to install the gem and its dependencies.

2. **Configuration:**

   - Replace `'cb33a3ede2724c39a3fed84b3ec99a94'` with your Rawg API key in both the controller and the wrapper class.

3. **Making Requests:**

   - Within the `RawgWrapper` class, methods utilize `HTTParty` to make HTTP requests to the Rawg API endpoints. For instance:

     ```ruby
     def self.get_games(api_key, options = {})
       query_params = { key: api_key }.merge(options)
       get('/games', query: query_params)
     end
     ```

   - `HTTParty.get` is employed to make the HTTP GET request to the specified endpoint (`/games`) with the provided query parameters.

