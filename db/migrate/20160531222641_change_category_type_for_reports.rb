class ChangeCategoryTypeForReports < ActiveRecord::Migration
  def change
    change_column :reports, :category,'integer USING CAST(category AS integer)'
  end
end
