class Race < ApplicationRecord

  # I dont think the below is needed for association:
  has_many :battlelords
  has_one :vital_stat

  delegate :strength, :to => :vital_stat
  delegate :dexterity, :to => :vital_stat
  delegate :iq, :to => :vital_stat
  delegate :agility, :to => :vital_stat
  delegate :constitution, :to => :vital_stat
  delegate :aggression, :to => :vital_stat
  delegate :intuition, :to => :vital_stat
  delegate :charisma, :to => :vital_stat

end
