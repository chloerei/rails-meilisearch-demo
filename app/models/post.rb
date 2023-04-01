class Post < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :pg_search,
    against: [:headline, :content],
    using: {
      tsearch: { dictionary: "simple" }
      # tsearch: { dictionary: "chinese" }
      # tsearch: { dictionary: "jiebaqry" }
    }

  include MeiliSearch::Rails
  meilisearch do
    searchable_attributes [:headline, :content]
    filterable_attributes [:tag]
    sortable_attributes [:date]
  end

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
end
