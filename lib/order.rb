class Order

attr_reader :list_of_dishes, :current_order

  def initialize
    @list_of_dishes = { :pizza => "£9" }
    @current_order
  end

  # def list_of_dishes
  #   { :pizza => 9 }
  # end

  def order(order, quantity)
    "You have ordered #{quantity} #{order}."
  end


private

  def bill
  end

end
