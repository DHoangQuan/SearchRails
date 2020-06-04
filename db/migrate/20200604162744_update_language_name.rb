class UpdateLanguageName < ActiveRecord::Migration[6.0]
  def change
    remove_column :languages, :languagename, :string
    add_column :languages, :language_name, :string
  end
end
