class CreateFiguresTable < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
    end
  end
end
