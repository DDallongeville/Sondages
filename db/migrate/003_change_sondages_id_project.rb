class ChangeSondagesIdProject < ActiveRecord::Migration
  def change
    add_column :sondages, :id_project, :integer
  end
end
