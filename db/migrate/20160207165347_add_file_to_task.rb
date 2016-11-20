class AddFileToTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :style 
    remove_column :tasks, :order
    remove_column :tasks, :result
    add_attachment :tasks, :style
    add_attachment :tasks, :order
    add_attachment :tasks, :result
  end
end
