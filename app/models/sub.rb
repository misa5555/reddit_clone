class Sub < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :moderator_id, presence: true
  validates :title, uniqueness: { scope: :moderator_id,
      message: "moderator can not have same two title"}

  belongs_to(
    :moderator,
    class_name: 'User',
    foreign_key: :moderator_id,
    primary_key: :id
  )
  has_many :posts

end
