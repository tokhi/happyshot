class AddTypeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :type_cd, :integer
  end
end
