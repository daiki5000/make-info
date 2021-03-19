class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :info, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :info_id], unique: true
    end
  end
end
