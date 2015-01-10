require_relative '../database.rb'

class CreateReviews < ActiveRecord::Migration
  def up
    create_table(:reviews) do |t|
      t.text :content
      t.date :date
      t.string :username
      t.integer :stars

      t.timestamps
    end
  end
end

CreateReviews.new.up
