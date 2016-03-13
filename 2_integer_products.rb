ints = [1, 7, 3, 4]

def find_products(arr)
  products_of_all_ints_except_at_index = []
  
  # for each int, find the product of all the integers before it, storing the product each time.
  product_so_far = 1
  i = 0
  while i < arr.length
    products_of_all_ints_except_at_index[i] = product_so_far
    product_so_far *= arr[i]
    i += 1
  end

  # for each integer, find the product of all the integers after it.
  product_so_far = 1
  i = arr.length - 1
  while i >= 0
    products_of_all_ints_except_at_index[i] *= product_so_far
    product_so_far *= arr[i]
    i -= 1
  end

  return products_of_all_ints_except_at_index
end

puts find_products ints
