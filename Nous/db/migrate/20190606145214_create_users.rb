class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.text :keywords, array: true, default:[]
      t.text :sources, array: true, default:[]
      t.text :exclusions, array: true, default:[]

      t.timestamps
    end
  end
end
