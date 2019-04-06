class ProductsController < ApplicationController
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
    
    if @products.count % LIMITED_PRODUCTS_NUMBER
        @last_page += 1
    end 
    
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

  def new

    @note = flash[:note]
    
    @product = Product.new

  end

  def create
    product = Product.create(product_permit)
    
    flash[:note] = product.id #flash 是用來做一個產生note的方法再丟到 new page 去接
    redirect_to action: :new
    
  end

  def product_permit
    return params.require(:product).permit([:name, :description, :image_url, :price])
  end

  def edit
    @product = Product.find(params[:id]) #抓到輸入的id
  end

  def update

    product = Product.find(params[:id])
    product.update(product_permit) #product_permit 在上面有做過, 代表是做特定的更新

    redirect_to action: :edit

  end

end
