class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, 
             presence: true, 
             confirmation: true, 
             length: { minimum: 6}

  # relationships           
  has_many :resumes

  # callbacks
  before_create :encrypt_password

  def self.login(user_data)
    account = user_data[:account]
    password = user_data[:password]

    if account && password
      user = find_by("email = ? OR username = ?", account, account)
      if user && user.password == HelloKitty::Encoder.encode_password(password)
        user
      else
        nil
      end
    else
      nil
    end
  end

  def default_resume
    resumes.last
  end

  private
    def encrypt_password
      self.password = HelloKitty::Encoder.encode_password(self.password)
    end
end
