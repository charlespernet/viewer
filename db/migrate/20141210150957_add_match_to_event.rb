class AddMatchToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :match, index: true
  end
end
