class CreateProjectsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :client
      t.string :summary
      t.integer :user_id
    end
  end
end
