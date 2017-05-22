# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.uncountable %w( vital_stats_table_strength VitalStatsTableStrength )
  inflect.uncountable %w( vital_stats_table_dexterity VitalStatsTableDexterity )
  inflect.uncountable %w( vital_stats_table_iq VitalStatsTableIQ )
  inflect.uncountable %w( vital_stats_table_agility VitalStatsTableAgility )
  inflect.uncountable %w( vital_stats_table_constitution VitalStatsTableConstitution )
  inflect.uncountable %w( vital_stats_table_intuition VitalStatsTableIntuition )
  inflect.uncountable %w( vital_stats_table_charisma VitalStatsTableCharisma )
end