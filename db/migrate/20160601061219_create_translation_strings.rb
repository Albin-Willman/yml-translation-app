class CreateTranslationStrings < ActiveRecord::Migration
  def change
    create_table :translation_strings do |t|
      t.string :key

      t.timestamps null: false
    end
  end
end
