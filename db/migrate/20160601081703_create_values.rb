class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.string :text
      t.belongs_to :language, foreign_key: true
      t.belongs_to :translation_string, foreign_key: true

      t.timestamps
    end
  end
end
