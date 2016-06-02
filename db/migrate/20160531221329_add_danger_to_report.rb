class AddDangerToReport < ActiveRecord::Migration
  def change
    add_column :reports, :danger_level, :integer
  end
end
