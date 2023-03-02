class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :title
      t.string :image_path, default: "https://ahaslides.com/wp-content/uploads/2022/11/SEO1485-thumb.png"

      t.timestamps
    end
  end
end
