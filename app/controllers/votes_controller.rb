class VotesController < ApplicationController

  #calls the private method before any action is performed on the page.
  before_action :load_post_and_vote

  #for up-voting
  def up_vote
    update_vote!(1)
    redirect_to :back
  end

  #for down-voting
  def down_vote
    update_vote!(-1)
    redirect_to :back
  end

  private

  #private method to find the post and load the voting information
  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end

  #First checks if the vote made by the user is authorized, then updates it with the new_value
  def update_vote!(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.build(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    end
  end
end