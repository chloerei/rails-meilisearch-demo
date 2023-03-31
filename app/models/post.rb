class Post < ApplicationRecord
  include PgSearch::Model
  include MeiliSearch::Rails

  # multisearchable against: [:headline, :content]

  # pg_search_scope :search_full_text, against: {
  #   headline: 'A',
  #   content: 'B'
  # }

  meilisearch do
    attribute :headline, :content
  end
end
