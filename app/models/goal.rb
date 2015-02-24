class Goal < ActiveRecord::Base
validates :client_target, numericality: true, presence: true, if: :not_zero_or_less
 
  def not_zero_or_less
    if client_target == 0 || client_target < 0
      errors.add(:client_target, "can't be less than 1")
    end
  end

end
