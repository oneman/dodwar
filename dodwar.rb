#!/usr/bin/env ruby 

# 'funworld' game
# 2010 drr
# all rights reservated

require 'rubygems'
gem 'gosu'
require 'gosu'

class Game < Gosu::Window

  
  def initialize

    puts "Starting dodwar"
    #mapfile = STDIN.gets.chomp
    @xres = 1920
    @yres = 1080

    super(@xres, @yres, true)

    self.caption = "dodwar"
    #@background_image = Gosu::Image.new(self, "/home/oneman/kode/funworld/maps/radplace.png", true)
    @thing = Gosu::Image.new(self, "/home/oneman/kode/dodwar/thing.png", true)
    @dodwar_text = Gosu::Image.new(self, "/home/oneman/kode/dodwar/dodwar.png", true)
    @bg1 = Gosu::Image.new(self, "/home/oneman/kode/dodwar/bg1.png", true)
   # console
  end

  def getnewamount
   @xadding ||= 10
   @yadding ||= 10
   @amount = rand(20)
   @xamount = @amount
   @yamount = 20 - @amount
  end

  def draw
    #@background_image.draw(0, 0, 0);
   # @peices.each { |peice| @map = peice.draw(@map) }
   # @player.draw
   @tangle ||= 1
   @xtext ||= 200
   @ytext ||= 200
   @stretch ||= 1
   @stretching ||= 1
   @xadding ||= 1
   @yadding ||= 1
   @xamount ||= 10
   @yamount ||= 10


   if @stretching == 1 
   @stretch = @stretch + 0.02


   else
   @stretch = @stretch - 0.02


   end

   

   if @xadding == 1 
      @xtext = @xtext + @xamount


   else
      @xtext = @xtext - @xamount


   end

   if @yadding == 1 

      @ytext = @ytext + @yamount

   else

      @ytext = @ytext - @yamount

   end

   if @stretch > 2
    @stretching = 0

   end

   if @stretch < 1
    @stretching = 1

   end


   if @xtext < 200
    @xadding = 1
    getnewamount
   end

   if @ytext < 200
    @yadding = 1
    getnewamount
   end

   if @xtext > (@xres - 200)
    @xadding = 0
    getnewamount
   end

   if @ytext > (@yres - 100)
    @yadding = 0
    getnewamount
   end

    @angle ||= 0 
   @working_size = 150
   @cur_x = 150
   @cur_y = 200  

   @dodwar_text.draw_rot(@xtext, @ytext, 2, @tangle - @stretch, 0.5, 0.5, @stretch, @stretch)

   

  @bg1.draw_rot(0,0,0, -(@angle), 0.5,0.5,15,15) 


   ((@xres / @working_size) - 1).times do 
    ((@yres / @working_size) - 1).times do
      @thing.draw_rot(@cur_x,@cur_y,1, @angle, 0.5, 0.5, @stretch, @stretch)

     @cur_y = @cur_y + @working_size 
    end
    @cur_y = 200
    @cur_x = @cur_x + @working_size
   end  

   @angle = @angle + 7;
   @tangle = @tangle + 0.4;
   if @angle > 360
    @angle = 0
   end

   if @tangle > 50
    @tangle = @tangle + 3
   end
   if @tangle > 359
    @tangle = 0
   end
puts @tangle

  end

  def update

    if button_down? Gosu::Button::KbQ then
      Kernel.exit
    end
    if button_down? Gosu::Button::KbRight or button_down? Gosu::Button::GpRight then
     # @player.turn_right
    end
    if button_down? Gosu::Button::KbUp or button_down? Gosu::Button::GpButton0 then
     # @player.accelerate(@map)
    end


 end
  


  
end


game = Game.new
game.show
