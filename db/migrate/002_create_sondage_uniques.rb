class CreateSondageUniques < ActiveRecord::Migration
  def change
    create_table :sondage_uniques do |t|
      t.integer :id_user
      t.integer :id_quest
    end
  end
end
