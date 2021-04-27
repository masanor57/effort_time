class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reports, dependent: :destroy
  has_many :report_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def follow(user_id)
    unless self.id == user_id.to_i
      following_relationships.create(following_id: user_id)
    end
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', '%'+content+'%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%'+content+'%')
    else
      User.where('name LIKE ?', '%'+content+'%')
    end
  end


end
