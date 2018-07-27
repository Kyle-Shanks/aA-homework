class Map
  attr_reader :map

  def initialize(map = [])
    @map = map
  end

  def set(key,val)
    delete(key)
    @map << [key,val]
  end

  def get(key)
    arr = @map.find { |el| el[0] == key }
    arr ? arr[1] : arr
  end

  def delete(key)
    @map.reject! {|el| el[0] == key}
  end

  def show
    @map
  end
end
