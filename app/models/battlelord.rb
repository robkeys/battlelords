class Battlelord < ApplicationRecord

  belongs_to :race
  belongs_to :base_vs, :class_name => 'VitalStat', :foreign_key => :base_vs_id,
             :optional => true, :dependent => :destroy
  belongs_to :base_ds, :class_name => 'DerivedStat', :foreign_key => :base_ds_id,
             :optional => true, :dependent => :destroy
  belongs_to :base_ss, :class_name => 'SecondaryStat', :foreign_key => :base_ss_id,
             :optional => true, :dependent => :destroy
  belongs_to :base_smr, :class_name => 'SmrScore', :foreign_key => :base_smr_id,
             :optional => true, :dependent => :destroy
  has_many :vital_stats
  has_many :derived_stats
  has_many :secondary_stats
  has_many :smr_scores

  scope :id_sort, lambda { order('id ASC')}

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

  def create_base_scores
    vs = VitalStat.create!(:battlelord_id => self.id, :is_base => true )
    ds = DerivedStat.create!(:battlelord_id => self.id, :is_base => true )
    ss = SecondaryStat.create!(:battlelord_id => self.id, :is_base => true )
    smr = SmrScore.create!(:battlelord_id => self.id, :is_base => true )
    self.attributes = { :base_vs_id => vs.id, :base_ds_id => ds.id, :base_ss_id => ss.id, :base_smr_id => smr.id }
    self.create_scores
    self.calculate_scores
  end

  def create_scores
    self.vs_names.each do |vs|
      eval("self.base_vs.update :#{vs} => self.#{vs}")
    end
  end

  def calculate_scores
    self.vs_names.each do |vs|
      eval("self.#{vs} = self.base_vs.#{vs} + self.race.#{vs}")
    end
    self.base_ds.calculate_derived_stats(self.vs_scores)
  end

end
