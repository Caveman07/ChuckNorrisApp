class CreateJokes < ActiveRecord::Migration[5.0]
  def change
    create_table :jokes do |t|
      t.text :joke
      t.boolean :is_shown, default: false

      t.timestamps
    end
  end
end
