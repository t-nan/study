class AutomaticBreaker < ApplicationRecord

  scope :active, -> { where(manufacturer:["IEK","EKF"])}

  def self.ransackable_scopes(auth_object = nil)
    [:active]
  end
end
