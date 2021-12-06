module ProductsHelper

  def recommended_flag_to_mark(product)
    if product.is_recommended
      "●"
    else
      ""
    end
  end

end
