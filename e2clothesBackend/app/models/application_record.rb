class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # default per page is 10 , and start from page 1
  # TODO: number exception
  def self.pages(page: 1, per_page: 10)
    p = (page.to_i / 10) + 1
    paginate(page: p, per_page: per_page)
  end
end
