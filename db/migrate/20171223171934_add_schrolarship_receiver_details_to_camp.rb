class AddSchrolarshipReceiverDetailsToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :scholarship_receiver_name, :string
    add_column :camps, :scholarship_receiver_id, :string
    add_column :camps, :scholarship_receiver_living_address, :string
    add_column :camps, :scholarship_receiver_mailing_address, :string

    add_column :camps, :scholarship_receiver_bank_account_name, :string
    add_column :camps, :scholarship_receiver_bank_account_branch_name, :string
    add_column :camps, :scholarship_receiver_bank_account_branch_number, :string
    add_column :camps, :scholarship_receiver_bank_account_number, :string

    add_column :camps, :scholarship_receiver_contact_email, :string
    add_column :camps, :scholarship_receiver_contact_phone, :string
  end
end
