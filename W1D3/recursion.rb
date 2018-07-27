# Recursion!
def sum_to(num)
  return nil if num <= 0
  return 1 if num == 1
  num + sum_to(num-1)
end

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr.first + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(arr,flavor)
  return false if arr.length == 0
  return true if arr.first == flavor
  ice_cream_shop(arr[1..-1],flavor)
end

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end
