class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.integer     :level
      t.belongs_to  :user    
      t.belongs_to  :language
      t.datetime    :ranked_at
      t.text        :admin_notes

      t.timestamps
    end
  end
end
