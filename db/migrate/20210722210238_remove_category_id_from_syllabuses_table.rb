class RemoveCategoryIdFromSyllabusesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :syllabuses, :category_id, :integer
  end
end
