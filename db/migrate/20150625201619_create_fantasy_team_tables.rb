class CreateFantasyTeamTables < ActiveRecord::Migration
  def change
    create_table :fantasy_sites do |t|
      t.string :name
      t.string :abbr
      t.string :domain
      t.timestamps :null => false
    end
    create_table :fantasy_leagues do |t|
      t.string :name
      t.string :site_generated_id
      t.references :sport, index: true
      t.references :site, index: true
      t.timestamps :null => false
    end
    create_table :fantasy_teams do |t|
      t.string :name
      t.string :site_generated_id
      t.references :fantasy_league, index: true
      t.references :user, index: true
      t.timestamps :null => false
    end
    create_table :positions do |t|
      t.string :name
      t.string :abbr
      t.references :sport, index: true
      t.boolean :real
      t.boolean :fantasy
      t.integer :fielding_number
      t.integer :order
      t.timestamps :null => false
    end
    create_table :position_indices do |t|
      t.references :fantasy_position, references: :positions
      t.references :real_position, references: :positions
      t.timestamps :null => false
    end
    create_table :fantasy_rosterspots do |t|
      t.references :fantasy_team, index: true
      t.references :player, index: true
      t.references :position, index: true
      t.date :date, index: true
      t.timestamps :null => false
    end
  end
end
