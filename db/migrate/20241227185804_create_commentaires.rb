class CreateCommentaires < ActiveRecord::Migration[7.1]
  def change
    create_table :commentaires do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.text :contenu

      t.timestamps
    end
  end
end
