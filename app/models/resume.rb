class Resume < ApplicationRecord
  extend FriendlyId
  friendly_id :random_slug, use: :slugged
  # -> slug

  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true


  # scope :published -> {}
  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }

  # relationships
  belongs_to :user

  def self.all_status
    [
      ["草稿", "draft"], 
      ["發布", "published"],
    ]
  end

  private
    def random_slug # 把網址上的履歷編號變亂數
      [*"0".."9", *"a".."z", "-", "_"].sample(10).join
    end
end
