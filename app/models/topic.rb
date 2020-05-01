class Topic < ApplicationRecord
	belongs_to :user

	validate :check_topic_already_belong

  def check_topic_already_belong
    if Topic.where(user_id: user_id, question_id: question_id).present?
      errors.add(:base, 'Already following')
    end
  end
end
