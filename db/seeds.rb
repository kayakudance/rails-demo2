10.times do |i|
  product = Product.create(
    name: "ダミー商品#{i + 1}",
    description: "この商品はダミー商品#{i + 1}です。",
    price:  100 + 100 * i
  )
  product.image.attach(io: File.open('./public/images/dummy.jpeg'), filename: 'dummy.pdf')
end