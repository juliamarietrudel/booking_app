module DateHelper
  def next_weekday(weekday)
    date = Date.today
    days_until_next_weekday = (weekday - date.wday) % 7
    days_until_next_weekday = 7 if days_until_next_weekday.zero?
    date + days_until_next_weekday
  end
end
