class DeleteFirstLastNamesColumns < ActiveRecord::Migration
  def change
    
    change_table :students do |t|
      remove_column :students, :first_name
      remove_column :students, :last_name

    end
  end
end
