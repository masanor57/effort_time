class Report < ApplicationRecord

   belongs_to :user
   has_many :report_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

   validates :body, presence: true, length: {maximum: 200}

   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end

   def self.search_for(content, method)
    if method == 'perfect'
      Report.where(title: content)
    elsif method == 'forward'
      Report.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Report.where('title LIKE ?', '%'+content)
    else
      Report.where('title LIKE ?', '%'+content+'%')
    end
   end

end
