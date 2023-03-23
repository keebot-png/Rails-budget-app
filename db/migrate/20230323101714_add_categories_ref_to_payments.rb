class AddCategoriesRefToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :category, foreign_key: { to_table: :payments }
  end
end
