class Following < ApplicationRecord
	belongs_to :user

	validate :check_user_already_followed

  def check_user_already_followed
    if Following.where(following_id: following_id,
    									 user_id: user_id).present?
      errors.add(:base, 'Already following')
    end
  end
end
