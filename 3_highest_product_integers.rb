arr = [6, 2, 7, 3, 5, 2]

def find_highest_product(arr)
  if arr.length < 3
    raise Exception, 'Less than 3 items!'
  end

  highest = [arr[0], arr[1]].max
  lowest = [arr[0], arr[1]].min
  lowest_product_of_2 = arr[0] * arr[1]
  highest_product_of_2 = arr[0] * arr[1]
  highest_product_of_three = arr[0] * arr[1] * arr[2]

  arr.each_with_index do |current, index|
    next if index < 2

    # check to see if there is a new highest 3
    # we check the lowest in case both are negative numbers
    highest_product_of_three = [
      highest_product_of_three,
      current * highest_product_of_2,
      current * lowest_product_of_2
    ].max

    # check if new highest product of 2
    highest_product_of_2 = [
      highest_product_of_2,
      current * highest,
      current * lowest
    ].max

    # check if new lowest product of 2
    lowest_product_of_2 = [
      lowest_product_of_2,
      current * highest,
      current * lowest
    ].min

    highest = [highest, current].max

    lowest = [lowest, current].min
  end

  return highest_product_of_three
end

puts find_highest_product arr
