class Vote < ActiveRecord::Base

	#basic model relationships
	belongs_to :user
	belongs_to :post

	##
	 #validates the number of votes it be tied too the user, meaning a min of -1 and 1 for each user.
	 #if else this error message will pop out

	validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

	#after save it calls this private method
	after_save :update_post

	#the value number for an up_vote
	def up_vote?
		value == 1
	end

	#the value number for a down_vote
	def down_vote?
		value == -1
	end

	private

	#private method for arrange the popularity of the posts
	def update_post
		post.update_rank
	end

end
