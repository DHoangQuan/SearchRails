class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :email
      
      t.timestamps
    end
    create_table :languages do |t|
      t.string :languagename
      t.timestamps
    end
    create_table :programming_languages do |t|
      t.string :name
      t.timestamps
    end
    create_table :developer_languages do |t|
      t.timestamps
    end
    create_table :developer_programming_languages do |t|
      t.timestamps
    end
  end
end
