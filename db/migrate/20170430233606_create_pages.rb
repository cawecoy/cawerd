class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :url, null: false
      t.datetime :access_at, null: false
      t.string :uid, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
