class HomeController < ApplicationController
  LIMITED_PRODUCTS_NUMBER = 20
  
  def index
    @ad = {
      title: "大型廣告1",
      des: "這是廣告",
      action_title: "這是廣告",
      }
    
    
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end
    
    @products = Product.all

    @first_page = 1
    @last_page = ( @products.count / LIMITED_PRODUCTS_NUMBER )
    
    
    
#    @products = []
#    (1..PRODUCTS_COUNT).each do |index|
#      product = {
#        id: index,
#        name: "柳橙汁#{index}",
#        description: "好喝柳橙汁",
#        image_url: "https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?h=350&auto=compress&cs=tinysrgb",
#      }
#      
#      @products << product
#    end
#    
    @products = @products.offset((@page -1) * LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
  end
end
