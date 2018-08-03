require "rspec"
require "lru_cache"

describe LRUCache do
  subject(:cache) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes an empty cache" do
      expect(cache.count).to eq(0)
    end
    it "sets the size limit of the cache" do
      expect(cache.limit).to eq(4)
    end
  end

  describe "#count" do
    context "when the cache is empty" do
      it "returns a length of 0" do
        expect(cache.count).to eq(0)
      end
    end

    context "when elements have been added" do
      it "returns the cache's length" do
        cache.add("string")
        cache.add(123)
        expect(cache.count).to eq(2)
      end
    end
  end

  describe "#add" do
    before(:each) do
      cache.add("string")
      cache.add(123)
      cache.add(:sym)
    end

    it "adds elements in the correct order" do
      expect(cache.show).to eq(["string",123,:sym])
    end

    it "does not exceed the specified size limit" do
      cache.add("more")
      cache.add(:elements)
      expect(cache.count).to eq(4)
    end
  end
end
