class SondageUnique < ActiveRecord::Base
	belongs_to :sondage
	
	def self.vote_effectuer(id_quest)
		if self.where("id_quest = ? and id_user = ?",id_quest,User.current.id).count != 0
			return 1
		else
			return 0
		end
	end
	
	def self.creer_vote(id_quest)
		self.create() do |u|
			u.id_user = User.current.id
			u.id_quest = id_quest
		end
	end
end
