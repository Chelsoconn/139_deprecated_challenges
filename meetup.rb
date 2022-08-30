require 'date'

class Meetup
  TEENTH = (13..19).to_a

  def initialize(month_num, year_num)
    @year_num = year_num 
    @month_num = month_num
    @date_start = Date.new(year_num, month_num,1)
    @date_end = Date.new(year_num, month_num, -1)
  end

  def day(day_sym, suff)
    wdays = get_hash(day_sym).keys
    x = case suff.to_s
    when 'first' then wdays[0]
    when 'second' then wdays[1]
    when 'third' then wdays[2]
    when 'fourth' then wdays[3]
    when 'teenth' then wdays.select{|x| TEENTH.include?x}[0]
    when 'last' then wdays[-1]
    end   
    Date.civil(@year_num, @month_num, x)
  end

  private 

  def get_hash(day_sym)
    hash = @date_start.upto(@date_end).each_with_object({}) do |day,obj|
      obj[day.day] = day.strftime("%A").downcase
    end 
    days = hash.select{|date, day| day == day_sym.to_s}
  end 
end



