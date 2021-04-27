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
      Report.where(body: content)
    elsif method == 'forward'
      Report.where('body LIKE ?', content+'%')
    elsif method == 'backward'
      Report.where('body LIKE ?', '%'+content)
    else
      Report.where('body LIKE ?', '%'+content+'%')
    end
   end

end
