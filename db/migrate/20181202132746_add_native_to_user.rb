class AddNativeToUser < ActiveRecord::Migration[5.2]
  def change
    # A user has one native language but many participation languages
    add_reference :users, :native, foreign_key: {to_table: :languages}
  end
end
