class CreateApiV1Cards < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_cards do |t|
      t.string :rank
      t.string :suit
      t.belongs_to :deck

      t.timestamps
    end
  end
end
