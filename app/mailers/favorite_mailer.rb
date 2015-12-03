class FavoriteMailer < ApplicationMailer
  default from: "jdcrouch5@gmail.com"

  def new_comment(user, post, comment)

       headers["Message-ID"] = "<comments/#{comment.id}@warm-earth-3169.herokuapp.com>"
       headers["In-Reply-To"] = "<post/#{post.id}@warm-earth-3169.herokuapp.com>"
       headers["References"] = "<post/#{post.id}@ywarm-earth-3169.herokuapp.com>"

       @user = user
       @post = post
       @comment = comment

       mail(to: user.email, subject: "New comment on #{post.title}")
     end

     def new_post(user, post)

        headers["In-Reply-To"] = "<post/#{post.id}@warm-earth-3169.herokuapp.com>"
        headers["References"] = "<post/#{post.id}@ywarm-earth-3169.herokuapp.com>"

        @user = user
        @post = post

        mail(to: user.email, subject: "You just posted: #{post.title}")
      end
end
