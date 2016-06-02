class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :major_road
      t.string :cross_street1
      t.string :cross_street2
      t.float :latitude
      t.float :longitude
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps null: false
    end
  end
end
