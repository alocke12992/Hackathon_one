class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :title
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
