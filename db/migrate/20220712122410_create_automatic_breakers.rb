class CreateAutomaticBreakers < ActiveRecord::Migration[6.0]
  def change
    create_table :automatic_breakers do |t|
      
      t.string :article_number
      t.integer :phases
      t.integer :nominal_current
      t.string :characteristic
      t.string :manufacturer
      
      t.timestamps
    end
  end
end
