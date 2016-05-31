class CreateJoinTableConfirmedIssuesReports < ActiveRecord::Migration
  def change
    create_join_table :confirmed_issues, :reports do |t|
      t.index [:confirmed_issue_id, :report_id]
      t.index [:report_id, :confirmed_issue_id]
    end
  end
end
