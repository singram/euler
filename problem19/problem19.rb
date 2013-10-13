# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.

# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.

# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require 'pp'


def calc_months(yr)
  months = {
    :jan => 31,
    :feb => 28,
    :mar => 31,
    :apr => 30,
    :may => 31,
    :jun => 30,
    :jul => 31,
    :aug => 31,
    :sep => 30,
    :oct => 31,
    :nov => 30,
    :dec => 31
  }
  months[:feb] = 29 if yr%4 == 0 && yr%100 != 0
  months[:feb] = 29 if yr%400 == 0
  months
end

def calc_month_starts(months)
  total = 0
  offsets = [0]
  months.values[0..10].each do |days|
    total += days
    offsets << total
  end
  offsets
end

def year_offset(old_offset, months)
  (old_offset+months.values.inject(&:+))%7
end

count = 0
year_off = 0 # 0 = Monday 6 = Sunday
(1901..2000).to_a.each do | yr|
  months = calc_months(yr)
  count += calc_month_starts(months).select{|month_off| (month_off + year_off)%7==6}.size
  year_off = year_offset(year_off, months)
end

pp count
