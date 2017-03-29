class AddUserRefToFactoids < ActiveRecord::Migration[5.0]
  def change
    add_reference :factoids, :user, foreign_key: true
  end
end
