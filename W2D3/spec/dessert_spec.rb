require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Jeremy the Great Baker") }

  let(:dessert) { Dessert.new("cake", 6, chef) }
  let(:bad_dessert) { Dessert.new("cake", "six", chef) }
  let(:ingredients_array) { ["flour", "eggs", "sugar", "water", "yeast"] }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{bad_dessert}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("flour")
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    before(:each) do
      ingredients_array.each {|ingredient| dessert.add_ingredient(ingredient)}
      dessert.mix!
    end

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to_not eq(ingredients_array)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(2)).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(7) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
