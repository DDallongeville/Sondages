class Sondage < ActiveRecord::Base
  has_many :sondage_uniques
  attr_accessible :question
  def vote(reponse)
    increment(reponse == 'oui' ? :oui : :non)
  end
  def self.new_sondage(sondage,id)
    sondages = self.new do |s|
      s.question = sondage.question
      s.id_project = id
    end
    return sondages
  end
end
