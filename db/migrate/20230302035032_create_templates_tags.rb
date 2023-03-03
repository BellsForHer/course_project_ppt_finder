class CreateTemplatesTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags_templates do |t|
      t.integer :template_id, null:false
      t.integer :tag_id, null:false

      t.timestamps
    end
  end
end
