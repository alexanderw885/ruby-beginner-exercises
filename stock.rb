def stock_picker(dates) 
  max_profit = dates[1] - dates[0]
  transaction_dates = [0,1]

  dates.each_with_index do |buy_val, buy_date|
    dates
    .slice(buy_date + 1, dates.length).each_with_index do |sell_val, days_to_hold|

      profit = sell_val - buy_val 
      if (profit > max_profit)
        transaction_dates = [buy_date, days_to_hold + buy_date + 1]
        max_profit = profit
      end

    end
  end
  transaction_dates
end


def test_result(expected, actual)
  if expected[0] == actual[0] && expected[1] == actual[1]
    puts "Test Passed!"
  else 
    puts "Test Failed..."
    p "  Expected: #{expected}"
    p "  Actual: #{actual}"
  end
end

# Example case
res = stock_picker([17,3,6,9,15,8,6,1,10])
test_result([1,4],  res)

# Max is after min
res = stock_picker([12,11,5,9,12,16,6,7,10])
test_result([2, 5], res)

# Minimizes loss
res = stock_picker([100, 95, 70, 68, 52])
test_result([2, 3], res)

