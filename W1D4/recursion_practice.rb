# Some recursion practice

# -----------------------------------------------------------------------------
class Array
  # Recursive quick sort method
  def quick_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|n1,n2| n1<=>n2}

    pivot = self[0]
    left = self.select { |el| prc.call(el,pivot) == -1 }
    right = self[1..-1].select { |el| prc.call(el,pivot) >= 0 }

    left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
  end

  # Recursive merge sort method
  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new { |n1,n2| n1<=>n2 } # Default incase no block is passed in
    mid = self.length/2
    left,right = self[0...mid],self[mid..-1]

    Array.merge(left.merge_sort(&prc),right.merge_sort(&prc),&prc)
  end

  private

  # Recursive helper function for merge_sort
  def self.merge(left,right,&prc)
    return left if right.empty?
    return right if left.empty?

    if prc.call(left[0],right[0]) == -1
      [left[0]] + Array.merge(left[1..-1],right,&prc)
    else
      [right[0]] + Array.merge(left,right[1..-1],&prc)
    end
  end
end
