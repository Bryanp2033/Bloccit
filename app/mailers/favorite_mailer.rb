
#automatic email to the user anytime someone posts a comment on their page
class FavoriteMailer < ApplicationMailer
	default from: "bryanporras2033@gmail.com"

	def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@Bloccit.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@Bloccit.example>"
     headers["References"] = "<post/#{post.id}@Bloccit.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
 end

