10.times do |i|
  Product.create(
    name: "ダミー商品#{i + 1}",
    description: "この商品はダミー商品#{i + 1}です。",
    price:  100 + 100 * i,
    image_path: "/images/dummy.jpeg"
  )
end