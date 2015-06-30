class AddVideoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_id, :string
  end
end
