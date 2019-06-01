class CreateProjectItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_items do |t|
      t.references :project, foreign_key: true
      t.float :value_to_pass
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
