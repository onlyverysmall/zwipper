class AddDefaultToZwipps < ActiveRecord::Migration
  def change
    change_column_default :zwipps, :text, ''
  end
end
