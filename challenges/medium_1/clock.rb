class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def +(minutes)
    operate('add', minutes)
  end

  def -(minutes)
    operate('sub', minutes)
  end

  def ==(other_clock)
    @hours == other_clock.hours && @minutes == other_clock.minutes
  end

  def to_s
    format('%02d:%02d', @hours, @minutes)
  end

  protected

  attr_reader :hours, :minutes

  private

  def clock_to_minutes(hours, minutes)
    60 * hours + minutes
  end

  def minutes_to_clock(total_minutes)
    hours, minutes = total_minutes.divmod(60)
    [hours % 24, minutes]
  end

  def operate(operation, minutes)
    total_minutes = clock_to_minutes(@hours, @minutes)
    case operation
    when 'add' then total_minutes += minutes
    when 'sub' then total_minutes -= minutes
    end
    @hours, @minutes = minutes_to_clock(total_minutes)
    self
  end
end
