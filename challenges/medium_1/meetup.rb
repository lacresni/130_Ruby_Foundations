# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.
require 'date'

class Meetup
  WEEKDAY_CONVERT = {
    sunday: 0, monday: 1, tuesday: 2, wednesday: 3,
    thursday: 4, friday: 5, saturday: 6
  }

  SCHEDULE_METHOD = {
    first: :find_first,
    second: :find_second,
    third: :find_third,
    fourth: :find_fourth,
    last: :find_last,
    teenth: :find_teenth
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    weekday_nb = weekday_to_int(weekday)
    # send => convert symbol to a method call
    send(SCHEDULE_METHOD[schedule], weekday_nb)
  end

  private

  def weekday_to_int(weekday)
    WEEKDAY_CONVERT[weekday]
  end

  def nb_days_in_month
    return 31 if [1, 3, 5, 7, 8, 10, 12].include?(@month)
    return 30 if [4, 6, 9, 11].include?(@month)

    # Deal with february
    Date.new(@year, 1, 1).leap? ? 29 : 28
  end

  def find_date(weekday_nb, start_date, direction: 'next_day')
    date = Date.new(@year, @month, start_date)
    while date.wday != weekday_nb
      date = direction == 'prev_day' ? date.prev_day : date.next_day
    end
    date
  end

  def find_teenth(weekday_nb)
    find_date(weekday_nb, 13, direction: 'next_day')
  end

  def find_first(weekday_nb)
    find_date(weekday_nb, 1, direction: 'next_day')
  end

  def find_second(weekday_nb)
    find_first(weekday_nb) + 7
  end

  def find_third(weekday_nb)
    find_first(weekday_nb) + 14
  end

  def find_fourth(weekday_nb)
    find_first(weekday_nb) + 21
  end

  def find_last(weekday_nb)
    last_day = nb_days_in_month
    find_date(weekday_nb, last_day, direction: 'prev_day')
  end
end
