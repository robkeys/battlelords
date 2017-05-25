# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

races = JSON.parse(File.read(Rails.root + 'db/json/races.json'))
races_vs = JSON.parse(File.read(Rails.root + 'db/json/races_vital_stats.json'))
races_ss = JSON.parse(File.read(Rails.root + 'db/json/races_secondary_stats.json'))
races_smr = JSON.parse(File.read(Rails.root + 'db/json/races_smr_scores.json'))
strength_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_strength.json'))
dexterity_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_dexterity.json'))
iq_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_iq.json'))
agility_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_agility.json'))
constitution_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_constitution.json'))
intuition_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_intuition.json'))
charisma_table = JSON.parse(File.read(Rails.root + 'db/json/vital_stats_table_charisma.json'))

races.each_with_index do |record, index|
  new_race = Race.new(record)
  new_vs = VitalStat.create!(races_vs[index])
  new_ss = SecondaryStat.create!(races_ss[index])
  new_smr = SmrScore.create!(races_smr[index])
  new_race.attributes = { :vital_stat_id => new_vs.id, :secondary_stat_id => new_ss.id, :smr_score_id => new_smr.id }
  new_race.save!
end

strength_table.each do |record|
  VitalStatsTableStrength.create!(record)
end

dexterity_table.each do |record|
  VitalStatsTableDexterity.create!(record)
end

iq_table.each do |record|
  VitalStatsTableIq.create!(record)
end

agility_table.each do |record|
  VitalStatsTableAgility.create!(record)
end

constitution_table.each do |record|
  VitalStatsTableConstitution.create!(record)
end

intuition_table.each do |record|
  VitalStatsTableIntuition.create!(record)
end

charisma_table.each do |record|
  VitalStatsTableCharisma.create!(record)
end