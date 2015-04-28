class AddNoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :note, :string
  end
end
