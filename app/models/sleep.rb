class Sleep < ApplicationRecord

  #Associations
  belongs_to :user

  #Callbacks
  before_save :set_duration

  #Validations
  validates :asleep_at, :woke_up_at, presence: true
  validate :validate_duration_not_in_future, :asleep_at_is_before_woke_up_at, on: :create

  #Scops
  scope :by_user_id, -> (user_id) { where(user_id: user_id)}
  scope :by_created_at, -> { where(created_at: 1.week.ago..Time.current) }
  scope :by_asc_order, -> { order(duration: :asc) }
  scope :by_desc_order, -> { order(created_at: :desc) }



  #Private methods
  private
  def validate_duration_not_in_future
    if self.woke_up_at.present? && self.woke_up_at > Time.zone.now
      errors.add(:woke_up_at, "can't be in the future")
    end
  end

  def asleep_at_is_before_woke_up_at
    if self.woke_up_at <= self.asleep_at
      errors.add(:woke_up_at, "can't be before asleep")
    end
  end

  def set_duration
    duration_seconds = Time.parse(self.woke_up_at.to_s) - Time.parse(self.asleep_at.to_s)
    formated_hash = Time.at(duration_seconds).utc.strftime("%H:%M:%S")
    self.duration = formated_hash
  end
end
