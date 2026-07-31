def bubble_sort(array) 
  (0...array.length).each do |n|
    (0...array.length - n - 1).each do |i|
      if (array[i] > array[i+1])      
        tmp = array[i]
        array[i] = array[i+1]
        array[i+1] = tmp
      end
    end
  end
  array
end

def test_array(expected, actual)
  if (expected.length != actual.length)
    p "Test Failed..."
    p "Expected: #{expected}"
    p "Actual: #{actual}"
    return 
  end
  expected.each_with_index do |e, i|
    if (e != actual[i])
      p "Test Failed..."
      p "Expected: #{expected}"
      p "Actual: #{actual}"
      return 
    end
  end
  p "Test Passed!"
end

# Example case
arr = [4,3,78,2,0,2]
test_array(arr.sort, bubble_sort(arr))

# Reversed array
arr = [5,4,3,2,1,0,-5]
test_array(arr.sort, bubble_sort(arr))

# Already sorted array
arr = [0,1,2,100]
test_array(arr.sort, bubble_sort(arr))

