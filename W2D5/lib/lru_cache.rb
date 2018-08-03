class LRUCache
  attr_reader :limit

  def initialize(size)
    @limit = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache << el
      @cache.shift if count > @limit
    end
    @cache
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end
end
