class CreateCompscrapers < ActiveRecord::Migration
  def self.up
    create_table :compscrapers do |t|
      t.integer :user_id, :null => false
      t.string :item_search_phrase
      t.string :word_that_occur
      t.string :sort_options
      t.decimal :lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.decimal :second_lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.decimal :third_lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.decimal :fourth_lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.decimal :fifth_lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.decimal :sixth_lowest_price,:decimal,:precision=>8,:scale=>2,:default=>0
      t.string :lowest_site
      t.string :second_lowest_site
      t.string :third_lowest_site
      t.string :fourth_lowest_site
      t.string :fifth_lowest_site
      t.string :sixth_lowest_site
      t.timestamps
    end
  end

  def self.down
    drop_table :compscrapers
  end
end
