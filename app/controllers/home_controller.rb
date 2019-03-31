class HomeController < ApplicationController
  
  def index
    # 所有在 index裡面使用的變數都定義在這邊

    @ad = {
      title: "大型廣告",
      des: "這是廣告",
      action_title: "閱讀更多"
    }

    @product = []

    arr = [1,2,3,4]

    arr.each do |index|
      product = {
        id: index,
        name: "柳橙汁#{index}",
        description: "好喝柳橙汁",
        image_url: "https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?h=350&auto=compress&cs=tinysrgb"


      }
    
    @product << product
    
  end


  
end
