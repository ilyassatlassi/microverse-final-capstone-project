class RemoveEmailConfirmationFromUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      t.remove :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    end
  end
end
