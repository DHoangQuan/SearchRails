class AddKey < ActiveRecord::Migration[6.0]
  def change
    add_column :developer_languages, :developer_id, :int
    add_column :developer_languages, :language_id, :int
    add_column :developer_programming_languages, :developer_id, :int
    add_column :developer_programming_languages, :programming_language_id, :int
  end
end
