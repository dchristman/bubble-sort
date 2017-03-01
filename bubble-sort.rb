def bubble_sort input_array
  finished = false
  until finished
    finished = true
    input_array.each_with_index do |value, index|
      unless index + 1 == input_array.length
        if block_given?
          compare = yield value, input_array[index+1]
        else
          compare = value <=> input_array[index + 1]
        end
        if compare > 0
          input_array = swap(input_array, index)
          finished = false
#        if (value > input_array[index + 1])
#          finished = false
#          input_array = swap(input_array, index)
        end
      end
    end
  end
  input_array
end

def swap array, position
  original_value = array[position]
  array[position] = array[position+1]
  array[position + 1] = original_value
  array
end


print bubble_sort([4,3,2,1])
puts ''
print bubble_sort(["hi","hello","hey"]) { |left,right| left.length - right.length }
puts ''
