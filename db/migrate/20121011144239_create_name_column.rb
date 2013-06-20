class CreateNameColumn < ActiveRecord::Migration
  def change
    
    change_table :students do |t|
      add_column :students, :name, :string

      Student.all.each do |student|
        student.update_attributes!(:name => student.name)
      end
    end
  end
end

