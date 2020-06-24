# Card-Game

This is card game based on API. We Can consume this API By using Faraday call in any gem or client.

## Getting Started

1. Clone the repository.
2. Install rvm (ruby version manager).
3. Install the version of Ruby mentioned in .ruby-version file.
4. Install postgresql.
5. Install the Gem dependencies

        bundle install

6. In order to run locally, the local postgresql database will need to be set up.

        rake db:create db:migrate RAILS_ENV=development
        rake db:create db:migrate RAILS_ENV=test

7. Start the server

        rails s

8. rspec and simplecove

        COVERAGE=true rspec

Then navigate to `localhost:3000` in your browser.

9. API Calls 
       
          a. http://localhost:3000/api/v1/games/create_game
                  Request:
                    {
                     "first_player": "First Player",
                     "second_player": "Second Player"
                    }
                    Response:
                    {
                        "id": 1,
                        "first_player": "First Player",
                        "second_player": "Second Player",
                        "created_at": "2020-06-24T15:29:49.945Z",
                        "updated_at": "2020-06-24T15:29:49.945Z"
                    }
       b. http://localhost:3000/api/v1/games/:game_id/show_card_by_game
                    {
                        "id": 523,
                        "rank": "10",
                        "suit": "Hearts",
                        "deck_id": 11,
                        "created_at": "2020-06-24T15:22:00.359Z",
                        "updated_at": "2020-06-24T15:22:00.359Z"
                    }
       c. http://localhost:4000/api/v1/games/:game_id/compare_cards
                    Request:
                    {
                     "cards":  ["10 of Hearts", "9 of Hearts"]
                    }
                    Response:
                    {
                        "winner": "10 of Hearts"
                    }

10. Rspec and Rubocop free code screenshot:
![image](https://user-images.githubusercontent.com/5196979/85590392-fe22d500-b661-11ea-977c-fa6cf0aa35a6.png)
![image](https://user-images.githubusercontent.com/5196979/85590563-23afde80-b662-11ea-936f-5b049421ecae.png)

11. Heroku deployed URL.
#### Base URL
          https://glacial-bayou-95789.herokuapp.com

![image](https://user-images.githubusercontent.com/5196979/85590817-59ed5e00-b662-11ea-8fb8-dfbf4e267698.png)




![image](https://user-images.githubusercontent.com/5196979/85591228-c36d6c80-b662-11ea-863a-12602d05f98e.png)




![image](https://user-images.githubusercontent.com/5196979/85591444-ef88ed80-b662-11ea-9544-aea63df729d3.png)



## What else is there

* Rspec and simplcove is implemented for all the testing.
* Rubocop for better coding practices

