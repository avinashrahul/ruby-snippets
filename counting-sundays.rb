# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

start_time = Time.local(1900) #Jan 1st of 1900
end_time = Time.local(2000, 12, 31)
sunday_counter = 0
while end_time >= start_time
  if end_time.strftime("%A") == "Sunday" && end_time.strftime("%d") == "01"
    sunday_counter = sunday_counter + 1
  end
  end_time = end_time - 86400
end
puts sunday_counter
