module ProductsHelper

  def recommended_flag_to_mark(product)
    if product.recommended_flag
      "●"
    else
      ""
    end
  end

end
