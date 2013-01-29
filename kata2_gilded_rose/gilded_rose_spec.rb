require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  before(:each) do
    @gr = GildedRose.new
  end
    # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
    it "Sulfuras never has to decrease in Quality" do
      o_quality = @gr.find_by_name("Sulfuras, Hand of Ragnaros", false).quality
      60.times { @gr.update_quality }
      @gr.find_by_name("Sulfuras, Hand of Ragnaros", false).quality.should == o_quality
    end

    # The Quality of an item is never more than 50
    it "items should never have a quality more than 50" do
      counter = @gr.find_by_name("Backstage passes to a TAFKAL80ETC concert", false).sell_in
      while counter == 1
        @gr.update_quality
        counter = counter - 1
      end
      @gr.find_by_name("Aged Brie", false).quality.should == 0
      60.times { @gr.update_quality }
      @gr.find_by_name("Aged Brie", false).quality.should == 50
    end

    # The Quality of an item is never negative
    it "items should never have a quality below 0" do
      item = @gr.find_by_name("Elixir of the Mongoose", false)
      index = @gr.find_by_name("Elixir of the Mongoose", true)
      (item.sell_in).times { @gr.update_quality } # bring item to sell_in date
      2.times { @gr.update_quality }
      @gr.find_by_name("Elixir of the Mongoose", false).quality.should_not < 0
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
        # @i = @gr.find_by_name("Aged Brie", false)
        @i = @gr.find_by_name("Backstage passes to a TAFKAL80ETC concert", false)
      end

      it "Quality increases by 2 when there are 10 days or less" do
        counter = @i.sell_in
        while counter >= 11
          @gr.update_quality
          counter = counter - 1
        end
        o_quality = @gr.find_by_name("Backstage passes to a TAFKAL80ETC concert", false).quality
        @gr.update_quality
        @gr.find_by_name("Backstage passes to a TAFKAL80ETC concert", false).quality.should == o_quality + 2
      end

      it "Quality increases by 3 when there are 5 days or less" do
        @i = @gr.find_by_name("Aged Brie", false)
        o_quality = @i.quality
        @gr.update_quality
        @gr.find_by_name("Aged Brie", false).quality.should == o_quality + 3
      end

      it "Quality drops to 0 after the concert" do
        counter = @i.sell_in
        while counter == 0
          @gr.update_quality
          counter = counter - 1
        end
        @gr.find_by_name("Aged Brie", false).quality.should == 0
      end
    end

    # "Aged Brie" actually increases in Quality the older it gets
    it "Aged Brie quality should increase the older it gets" do
      # item = @gr.find_by_name("Aged Brie", false)
      # index = @gr.find_by_name("Aged Brie", true)
      o_quality = @gr.find_by_name("Aged Brie", false).quality

      @gr.update_quality
      @gr.find_by_name("Aged Brie", false).quality.should > o_quality
    end

    # Once the sell by date has passed, Quality degrades twice as fast
    it "items should degrade in quality twice as fast once sell by date has passed" do
      item = @gr.find_by_name("Elixir of the Mongoose", false)
      index = @gr.find_by_name("Elixir of the Mongoose", true)

      o_sell_in = item.sell_in
      o_quality = item.quality

      (o_sell_in).times { @gr.update_quality }  # bring item to sell_in date
      @gr.update_quality
      @gr.find_by_name("Elixir of the Mongoose", false).quality.should == o_quality - o_sell_in - 2
    end

    it "conjured items should degrade twice as fast" do
      @i = @gr.find_by_name("Conjured Mana Cake", false)
      o_quality = @i.quality
      @gr.update_quality
      @i = @gr.find_by_name("Conjured Mana Cake", false)
      @i.quality.should == o_quality - 2
    end



end