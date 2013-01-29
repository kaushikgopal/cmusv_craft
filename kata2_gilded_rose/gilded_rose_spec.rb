require './gilded_rose.rb'
require "rspec"

describe GildedRose do


  # helpers
  let(:gr) {GildedRose.new}
  let(:sulfuras) {find_by_name("Sulfuras, Hand of Ragnaros")}
  let(:back_concert) {find_by_name("Backstage passes to a TAFKAL80ETC concert")}
  let(:abrie) {find_by_name("Aged Brie")}
  let(:elixir) {find_by_name("Elixir of the Mongoose")}
  let(:manacake) {find_by_name("Conjured Mana Cake")}

  def find_by_name(name)
    gr.items.find {|item| item.name == name }
  end

  def update_quality(n = 1)
    n.times { gr.update_quality }
  end



  # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
  it "Sulfuras never has to decrease in Quality" do
    o_quality = sulfuras.quality
    update_quality(60)
    sulfuras.quality.should == o_quality
  end


  # The Quality of an item is never more than 50
  it "items should never have a quality more than 50" do
    counter = back_concert.sell_in
    while counter == 1
      update_quality
      counter = counter - 1
    end

    abrie.quality.should == 0
    update_quality(60)
    abrie.quality.should == 50

  end

  # The Quality of an item is never negative
  it "items should never have a quality below 0" do
    item = elixir
    (item.sell_in).times { gr.update_quality } # bring item to sell_in date
    update_quality(2)
    elixir.quality.should_not < 0
  end

    # “Backstage passes”, like aged brie,
      # increases in Quality as it’s SellIn value approaches;
      # Quality increases by 2
        # when there are 10 days or less
      # Quality increases by 3
        # when there are 5 days or less
      # Quality drops to 0 after the concert

    context "Backstage passes" do
      before(:each) do
        # @i = abrie
        @i = back_concert
      end

      it "Quality increases by 2 when there are 10 days or less" do
        counter = @i.sell_in
        while counter >= 11
          update_quality
          counter = counter - 1
        end
        o_quality = back_concert.quality
        update_quality
        back_concert.quality.should == o_quality + 2
      end

      it "Quality increases by 3 when there are 5 days or less" do
        @i = abrie
        o_quality = @i.quality
        update_quality
        abrie.quality.should == o_quality + 3
      end

      it "Quality drops to 0 after the concert" do
        counter = @i.sell_in
        while counter == 0
          update_quality
          counter = counter - 1
        end
        abrie.quality.should == 0
      end
    end

    # "Aged Brie" actually increases in Quality the older it gets
    it "Aged Brie quality should increase the older it gets" do
      # item = abrie
      o_quality = abrie.quality

      update_quality
      abrie.quality.should > o_quality
    end

    # Once the sell by date has passed, Quality degrades twice as fast
    it "items should degrade in quality twice as fast once sell by date has passed" do
      item = elixir

      o_sell_in = item.sell_in
      o_quality = item.quality

      update_quality(o_sell_in) # bring item to sell_in date
      update_quality
      elixir.quality.should == o_quality - o_sell_in - 2
    end

    it "conjured items should degrade twice as fast" do
      @i = manacake
      o_quality = @i.quality
      update_quality
      @i = manacake
      @i.quality.should == o_quality - 2
    end



end