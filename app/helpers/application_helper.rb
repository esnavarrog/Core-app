module ApplicationHelper

   def format_date(date = nil)
      date.strftime('%d-%m-%Y') if date
   end

   def format_date_time(date = nil)
      date.strftime('%d-%m-%Y %H:%M') if date
   end

   def format_time(date = nil)
      date.strftime('%H:%M') if date
   end
end
