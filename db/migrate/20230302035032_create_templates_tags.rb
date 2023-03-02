class CreateTemplatesTags < ActiveRecord::Migration[7.0]
  def change
    create_table :templates_tags do |t|
      t.integer :template_id, null:false
      t.integer :tag_id, null:false

      t.timestamps
    end
  end
end
