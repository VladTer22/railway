class Carriage < ApplicationRecord
  TYPES = %w[CoupeCarriage SleepCarriage EconomyCarriage SittingCarriage].freeze
  SEATS_TYPES = %w[bottom top side_bottom side_top sitting].freeze

  belongs_to :trains_ids, class_name: "Train", foreign_key: :train_id

  validates :train_id, :number, presence: true
  validates :number, uniqueness: {scope: :train_id}

  before_validation :give_number

  def available_seats(type)
    case type.to_sym
    when :bottom
      down_seats - occupied_bottom
    when :top
      up_seats - occupied_top
    when :side_bottom
      side_seats_bottom - occupied_side_bottom
    when :side_top
      side_seats_top - occupied_side_top
    when :sitting
      sitting_seats - occupied_sitting
    else
      0
    end
  end

  def occupy(type)
    case type.to_sym
    when :bottom
      self.occupied_bottom += 1
    when :top
      self.occupied_top += 1
    when :side_bottom
      self.occupied_side_bottom += 1
    when :side_top
      self.occupied_side_top += 1
    when :sitting
      self.occupied_sitting += 1
    else
      raise StandardError
    end
    save
  end

  protected

  def give_number
    self.number ||= max_number + 1
  end

  def max_number
    Train.find(train_id).carriages.pluck(:number).max || 0
  end
end
