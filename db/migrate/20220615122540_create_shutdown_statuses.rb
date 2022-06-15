class CreateShutdownStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :shutdown_statuses do |t|
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
