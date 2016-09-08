class CreateFlakes < ActiveRecord::Migration
  def change
    create_table :flakes do |t|
      t.string :artist
      t.string :user_id
    end
  end
end
