stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

def get_max_profit(stock_prices_yesterday)
  # make sure there are 2 prices
  if stock_prices_yesterday.length < 2
    raise IndexError, 'Getting a profit requires at least 2 prices'
  end

  # greedily update min price and max profit, intialize to first possible
  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  stock_prices_yesterday.each_with_index do |current_price, index|
    # skip first time
    if index == 0 then next end

    # see what profit would be if bought at min and sold at current
    potential_profit = current_price - min_price
    
    # update max_profit if we can do better
    max_profit = [max_profit, potential_profit].max
    
    # update min_price so it's always the lowest seen
    min_price = [min_price, current_price].min
  end

  return max_profit
end

puts get_max_profit(stock_prices_yesterday)
