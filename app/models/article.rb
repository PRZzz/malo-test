class Article < ApplicationRecord
  include PgSearch::Model

  validates :title, presence: true

  pg_search_scope :search,
                  against: [:title, :tags],
                  using: { tsearch: {prefix: true} }
end