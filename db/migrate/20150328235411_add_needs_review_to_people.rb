class AddNeedsReviewToPeople < ActiveRecord::Migration
  def change
    add_column :people, :needs_review, :boolean, default: false
    add_column :people, :needs_review_reason, :string
  end
end
