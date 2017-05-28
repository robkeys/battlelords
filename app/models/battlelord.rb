class Battlelord < ApplicationRecord

  belongs_to :race
  belongs_to :base_vs, :class_name => 'VitalStat', :foreign_key => :base_vs_id, :dependent => :destroy
  belongs_to :base_ds, :class_name => 'DerivedStat', :foreign_key => :base_ds_id, :dependent => :destroy
  belongs_to :base_ss, :class_name => 'SecondaryStat', :foreign_key => :base_ss_id, :dependent => :destroy
  belongs_to :base_smr, :class_name => 'SmrScore', :foreign_key => :base_smr_id, :dependent => :destroy
  has_many :vital_stats
  has_many :derived_stats
  has_many :secondary_stats
  has_many :smr_scores

  accepts_nested_attributes_for :base_vs
  accepts_nested_attributes_for :base_ds
  accepts_nested_attributes_for :base_ss
  accepts_nested_attributes_for :base_smr

  scope :id_sort, lambda { order('id ASC')}

  before_save :calculate_scores

  def strength
    [self.base_vs.strength, self.race.strength].sum
  end
  
  def dexterity
    [self.base_vs.dexterity, self.race.dexterity].sum
  end
  
  def iq
    [self.base_vs.iq, self.race.iq].sum
  end
  
  def agility
    [self.base_vs.agility, self.race.agility].sum
  end
  
  def constitution
    [self.base_vs.constitution, self.race.constitution].sum
  end
  
  def aggression
    [self.base_vs.aggression, self.race.aggression].sum
  end
  
  def intuition
    [self.base_vs.intuition, self.race.intuition].sum
  end
  
  def charisma
    [self.base_vs.charisma, self.race.charisma].sum
  end

  def vs_names
    %w(strength dexterity iq agility constitution aggression intuition charisma)
  end
  
  def vs_base_scores
    [self.base_vs.strength, self.base_vs.dexterity, self.base_vs.iq, self.base_vs.agility, self.base_vs.constitution, 
     self.base_vs.aggression, self.base_vs.intuition, self.base_vs.charisma]
  end
  
  def vs_scores
    [self.strength, self.dexterity, self.iq, self.agility, self.constitution, self.aggression, self.intuition,
     self.charisma]
  end

  def vs_race_adj
    [self.race.strength, self.race.dexterity, self.race.iq, self.race.agility, self.race.constitution,
     self.race.aggression, self.race.intuition, self.race.charisma]
  end

  def calculate_scores
    self.base_ds.calculate_derived_stats(self.vs_scores)
  end

end
