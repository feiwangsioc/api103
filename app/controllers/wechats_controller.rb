class WechatsController < ApplicationController

   def index
     @wechats = Wechat.all
   end

end
