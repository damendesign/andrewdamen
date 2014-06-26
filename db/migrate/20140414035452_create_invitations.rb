class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      
      t.timestamps
    end
    add_index :invitations, :email
  end
end
