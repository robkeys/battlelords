class Race < ApplicationRecord

  # I dont think the below is needed for association:
  has_many :battlelords
  belongs_to :vital_stat
  belongs_to :secondary_stat
  belongs_to :smr_score

  delegate :strength, :to => :vital_stat
  delegate :dexterity, :to => :vital_stat
  delegate :iq, :to => :vital_stat
  delegate :agility, :to => :vital_stat
  delegate :constitution, :to => :vital_stat
  delegate :aggression, :to => :vital_stat
  delegate :intuition, :to => :vital_stat
  delegate :charisma, :to => :vital_stat
  delegate :terrestrial_knowledge, :to => :secondary_stat
  delegate :persuasion, :to => :secondary_stat
  delegate :military_leadership, :to => :secondary_stat
  delegate :bargaining, :to => :secondary_stat
  delegate :chemical, :to => :smr_score
  delegate :biological, :to => :smr_score
  delegate :poison, :to => :smr_score
  delegate :electricity, :to => :smr_score
  delegate :acid, :to => :smr_score
  delegate :radiation, :to => :smr_score
  delegate :mental, :to => :smr_score
  delegate :sonic, :to => :smr_score
  delegate :fire, :to => :smr_score
  delegate :cold, :to => :smr_score
  
  scope :id_sort, lambda { order('id ASC')}
  
end
