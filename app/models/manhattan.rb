class Manhattan < ActiveRecord::Base
  validates :name, :recipe, :num_cherries, :establishment, :city,
            presence: true
  after_save :expire_manhattan_all_cache
  after_destroy :expire_manhattan_all_cache

  def self.all_cached
    Rails.cache.fetch('Manhattan.all') { all }
  end

  def expire_manhattan_all_cache
    Rails.cache.delete('Manhattan.all')
  end
end
