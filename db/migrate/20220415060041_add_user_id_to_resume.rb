class AddUserIdToResume < ActiveRecord::Migration[6.1]
  def change
    # add_column(:resumes, :user_id, :integer)
    add_reference :resumes, :user, index: true
  end
end
