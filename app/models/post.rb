class Post < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :content]
  pg_search_scope :search_full_text, against: {
    title: 'A',
    content: 'B'
  }
end
