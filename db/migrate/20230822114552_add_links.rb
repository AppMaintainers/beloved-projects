class AddLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :description
      t.references :project
    end
  end
end
