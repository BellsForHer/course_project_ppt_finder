class AddFileToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :file, :attachment
  end
end
