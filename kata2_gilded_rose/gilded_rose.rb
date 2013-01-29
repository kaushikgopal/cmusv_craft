require './item.rb'

class GildedRose

  @items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def self.get_items
    @items
  end


  def update_quality
    for i in 0..(@items.size-1)


      if (@items[i].name != "Sulfuras, Hand of Ragnaros")
        # deduct sell_in
        @items[i].sell_in = @items[i].sell_in - 1



          if  (@items[i].name != "Aged Brie" && @items[i].name != "Backstage passes to a TAFKAL80ETC concert")

            # deduct quality main
            # non-backstage passes quality
            if (@items[i].quality > 0)
                if @items[i].sell_in < 1

                  if (@items[i].name != "Conjured Mana Cake")
                    @items[i].quality = @items[i].quality - 2
                  else
                    @items[i].quality = @items[i].quality - 4
                  end

                else

                  if (@items[i].name != "Conjured Mana Cake")
                    @items[i].quality = @items[i].quality - 1
                  else
                    @items[i].quality = @items[i].quality - 2
                  end

                end
                # quality can't go below 0
                @items[i].quality = 0 if @items[i].quality < 0

            else
              # quality can't go below 0
            end

          else
            # increase quality main
            # backstage passes quality
            if @items[i].quality < 50
              # check sell_in and accordingly increase quality
              if @items[i].sell_in == 0
                @items[i].quality = 0
              elsif @items[i].sell_in <= 5
                # puts "increase by 3" if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
                @items[i].quality = @items[i].quality + 3
              elsif @items[i].sell_in <= 10
                # puts "increase by 2" if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
                @items[i].quality = @items[i].quality + 2
              else
                # puts "increase by 1" if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
                @items[i].quality = @items[i].quality + 1
              end
              # quality can't go below 0
              @items[i].quality = 50 if @items[i].quality > 50
            else
              # 50 is maximum
            end
          end

        if @items[i].quality > 0
        else
          # quality can't below 0

        end


      end



    end
  end

  def find_by_name(name, get_index)
    @items.each do |i, indx|
      if i.name == name
        if get_index
           return indx
        else
          return i
        end
      end
    end
  end

  # def find_by_sell_in(sell_in, get_index)
  #   @items.each do |i, indx|
  #     if i.sell_in == sell_in
  #       if get_index
  #          return indx
  #          break
  #       else
  #         return i[indx]
  #         break
  #       end
  #     end
  #   end
  # end

  # def find_by_name(quality, get_index)
  #   @items.each do |i, indx|
  #     if i.quality == quality
  #       if get_index
  #          return indx
  #       else
  #         return i
  #       end
  #     end
  #   end
  # end


end