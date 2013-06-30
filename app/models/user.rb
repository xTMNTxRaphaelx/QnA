class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  has_many :questions
  has_many :answers

  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false },
  						length: { in: 4..12 },
  						format: { with: /^[a-zA-Z][a-zA-Z0-9]*$/, message: 'Can only be alphanumeric' }
  validates :password, length: { in: 4..9 }
  validates :password_confirmation, length: { in: 4..9 }

  def your_questions(params)
  	questions.paginate(page: params[:page], order: 'created_at DESC', per_page: 3)
  end
end
