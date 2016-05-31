class CreateJoinTableConfirmedIssuesReports < ActiveRecord::Migration
  def change
    create_join_table :confirmed_issues, :reports do |t|
      t.index([:confirmed_issue_id, :report_id], name: "idx_confirmed_issue_report")
      t.index([:report_id, :confirmed_issue_id], name: "idx_report_confirmed_issue")
    end
  end
end
