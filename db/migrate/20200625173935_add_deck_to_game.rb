class AddDeckToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :api_v1_games, :deck, :json, default: {}
  end
end
