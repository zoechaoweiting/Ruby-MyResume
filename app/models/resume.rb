class Resume < ApplicationRecord

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
end
