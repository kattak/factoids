class CreateFactoids < ActiveRecord::Migration[5.0]
  def change
    create_table :factoids do |t|
      t.text :text

      t.timestamps
    end
  end
end
