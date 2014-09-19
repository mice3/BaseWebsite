class Vacation < ActiveRecord::Base
  belongs_to :user

  scope :for_user_at_date,-> user_id, date {
    joins(:user)
    .where("email = ? and ? BETWEEN start_date AND end_date",user_id, date)
  }
end
