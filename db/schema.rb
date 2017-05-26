# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170524185401) do

  create_table "battlelords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "race_id"
    t.integer  "base_vs_id"
    t.integer  "base_ds_id"
    t.integer  "base_ss_id"
    t.integer  "base_smr_id"
    t.string   "name"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "iq"
    t.integer  "agility"
    t.integer  "constitution"
    t.integer  "aggression"
    t.integer  "intuition"
    t.integer  "charisma"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["race_id"], name: "index_battlelords_on_race_id", using: :btree
  end

  create_table "derived_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "battlelord_id"
    t.integer  "encumbrance"
    t.integer  "encumbrance_light"
    t.integer  "encumbrance_medium"
    t.integer  "encumbrance_severe"
    t.integer  "damage_adjustment"
    t.integer  "military_press"
    t.integer  "squat"
    t.integer  "dead_lift"
    t.integer  "ranged_attack_bonus"
    t.integer  "power_points"
    t.integer  "languages"
    t.integer  "initiative_modifier"
    t.integer  "defensive_modifier"
    t.integer  "melee_attack_bonus"
    t.integer  "system_shock"
    t.integer  "resurrection_percentage"
    t.integer  "deaths_door"
    t.integer  "body_points"
    t.integer  "physical_bonus"
    t.integer  "rage_chance"
    t.integer  "suicidal_chance"
    t.integer  "panic_chance"
    t.integer  "mental_bonus"
    t.integer  "reaction_modifier"
    t.integer  "loyalty_base"
    t.integer  "skill_bonus_strength"
    t.integer  "skill_bonus_dexterity"
    t.integer  "skill_bonus_iq"
    t.integer  "skill_bonus_agility"
    t.integer  "skill_bonus_constitution"
    t.integer  "skill_bonus_aggression"
    t.integer  "skill_bonus_intuition"
    t.integer  "skill_bonus_charisma"
    t.boolean  "is_base"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "races", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "vital_stat_id"
    t.integer  "secondary_stat_id"
    t.integer  "smr_score_id"
    t.string   "name"
    t.integer  "strength_min"
    t.integer  "strength_max"
    t.integer  "iq_min"
    t.integer  "iq_max"
    t.integer  "constitution_min"
    t.integer  "constitution_max"
    t.integer  "agility_min"
    t.integer  "agility_max"
    t.integer  "body_points_base"
    t.string   "body_points_dice"
    t.integer  "height_base"
    t.string   "height_dice"
    t.integer  "weight_base"
    t.string   "weight_dice"
    t.integer  "movement_mps"
    t.integer  "movement_kmph"
    t.integer  "movement_kmpd"
    t.integer  "vision"
    t.integer  "hearing"
    t.integer  "smell"
    t.integer  "starting_money_multiplier"
    t.string   "starting_money_dice"
    t.integer  "proficiency_points"
    t.string   "home_planet"
    t.string   "primary_occupation"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "secondary_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "battlelord_id"
    t.integer  "race_id"
    t.integer  "terrestrial_knowledge"
    t.integer  "persuasion"
    t.integer  "military_leadership"
    t.integer  "bargaining"
    t.boolean  "is_base"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "smr_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "battlelord_id"
    t.integer  "race_id"
    t.integer  "chemical"
    t.integer  "biological"
    t.integer  "poison"
    t.integer  "electricity"
    t.integer  "acid"
    t.integer  "radiation"
    t.integer  "mental"
    t.integer  "sonic"
    t.integer  "fire"
    t.integer  "cold"
    t.boolean  "is_base"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vital_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "battlelord_id"
    t.integer  "race_id"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "iq"
    t.integer  "agility"
    t.integer  "constitution"
    t.integer  "aggression"
    t.integer  "intuition"
    t.integer  "charisma"
    t.boolean  "is_base"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vital_stats_table_agility", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "initiative_modifier"
    t.integer "defensive_modifier"
    t.integer "skill_bonus"
    t.integer "melee_attack_bonus"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_charisma", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "reaction_modifier"
    t.integer "loyalty_base"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_constitution", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "system_shock"
    t.integer "resurrection_percentage"
    t.integer "deaths_door"
    t.integer "body_points"
    t.integer "physical_bonus"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_dexterity", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "ranged_attack_bonus"
    t.integer "skill_bonus"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_intuition", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "survival_matrix_adjust"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_iq", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "power_points"
    t.integer "languages"
    t.integer "skill_bonus"
    t.string  "flavor_text"
  end

  create_table "vital_stats_table_strength", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "value_min"
    t.integer "value_max"
    t.integer "encumbrance_light"
    t.integer "encumbrance_medium"
    t.integer "encumbrance_severe"
    t.integer "damage_adjustment"
    t.integer "skill_bonus"
    t.integer "military_press"
    t.integer "squat"
    t.integer "dead_lift"
    t.string  "flavor_text"
  end

end
