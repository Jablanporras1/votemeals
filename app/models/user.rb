class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  
  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end


   def voted(post)
    votes.where(post_id: post.id).first
   end
   
end