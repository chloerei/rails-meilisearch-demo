class Post < ApplicationRecord
  include PgSearch::Model
  include MeiliSearch::Rails

  multisearchable against: [:title, :content]
  pg_search_scope :search_full_text, against: {
    title: 'A',
    content: 'B'
  }

  meilisearch do
    attribute :title, :content
  end
end
