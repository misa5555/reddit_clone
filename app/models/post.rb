class Post < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :sub
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

end
