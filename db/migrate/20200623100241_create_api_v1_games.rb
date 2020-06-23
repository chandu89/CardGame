class CreateApiV1Games < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_games do |t|

      t.timestamps
    end
  end
end
