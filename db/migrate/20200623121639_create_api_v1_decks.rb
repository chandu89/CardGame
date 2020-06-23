class CreateApiV1Decks < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_decks do |t|
      t.belongs_to :game
      
      t.timestamps
    end
  end
end
