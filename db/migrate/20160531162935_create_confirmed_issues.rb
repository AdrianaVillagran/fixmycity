class CreateConfirmedIssues < ActiveRecord::Migration
  def change
    create_table :confirmed_issues do |t|
      t.string :title
      t.string :notes
      t.integer :category
      t.integer :danger_level
      t.integer :status
      t.float :latitude
      t.float :longitude
      t.string :major_road
      t.string :cross_street1
      t.string :cross_street2

      t.timestamps null: false
    end
  end
end
