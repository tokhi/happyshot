class AddIntervalToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :interval, :string
  end
end
