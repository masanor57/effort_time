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

  def following?(other_user)
    following_relationships.find_by(following_id: other_user)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user).destroy
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
