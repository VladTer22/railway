class Ticket < ApplicationRecord
  attr_accessor :carriage_type

  belongs_to :train
  belongs_to :user

  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :buy_notification

  after_destroy :return_notification

  validates :user_first_name, :user_last_name, :user_middle_name, :user_passport, presence: true

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def buy_notification
    TicketMailer.buy_ticket(user, self).deliver_now
  end

  def return_notification
    TicketMailer.return_ticket(user, self).deliver_now
  end
end
