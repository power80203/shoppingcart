class HomeController < ApplicationController

  #要用常數變數要全部大寫
  PRODUCT_CONUT = 100
  LIMITED_PRODUCTS_NUMBER = 20
  
  def index
    # 所有在 index裡面使用的變數都定義在這邊

    @ad = {
      title: "大型廣告",
      des: "這是廣告",
      action_title: "閱讀更多"
    }

    # params 就是拿來得到 http傳來的資訊
    # 當你在網址列打下 page/1 的時候, 預設就會把pages 用 1 放進去跑下面這串
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end 

    @first_page = 1
    @last_page = (PRODUCT_CONUT / LIMITED_PRODUCTS_NUMBER)

    @products = []


    arr = (1..PRODUCT_CONUT) # using range

    arr.each do |index|
      product = {
        id: index,
        name: "柳橙汁#{index}",
        description: "好喝柳橙汁",
        image_url: "https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?
        h=350&auto=compress&cs=tinysrgb"
      }
      @products << product
    end

    # 當你在網址列打下 page/1 的時候, products的內容只有1到20 這樣

    @products = @products[(@page - 1) * LIMITED_PRODUCTS_NUMBER, LIMITED_PRODUCTS_NUMBER ]
    
    
    
  end


  
end
