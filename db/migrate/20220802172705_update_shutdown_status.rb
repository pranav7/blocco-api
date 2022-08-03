class UpdateShutdownStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :shutdown_statuses, :week_number, :integer
    add_column :shutdown_statuses, :week_year, :integer
    add_column :shutdown_statuses, :week_day, :integer

    add_index :shutdown_statuses, [:week_number, :week_year, :week_day], unique: true, name: "idx_shutdown_statuses_on_day_and_week"
  end
end
