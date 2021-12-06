# initialize
# users = User.all

# User ---------------------------------
1.times do |i|
  User.create!(
    name: "東京太郎#{i +1}",
    email: "taro#{i + 1}@gmail.com",
    password: "00000#{i + 1}",
    password_confirmation: "00000#{i + 1}"
  )
end
#
# Admin ---------------------------------
1.times do |i|
  Admin.create(
    name: "東京太郎#{i +1}",
    email: "taro#{i + 1}@gmail.com",
    password: "00000#{i + 1}"
  )
end

# Products ---------------------------------
26.times do |i|
  product = Product.create(
    name: "ダミー商品#{i + 1}",
    description: "この商品はダミー商品#{i + 1}です。",
    price:  100 + 100 * i
  )
  product.image.attach(io: File.open('./public/images/dummy.jpeg'), filename: 'dummy.pdf')
end

# Cart ---------------------------------
# users.each do |user|
#   user.create_cart
# end

# Cart Item ---------------------------------
# t = 0
# users.each do |user|
#
#   3.times do |i|
#     t += 1
#     user.cart.cart_items.create(product_id: t, quantity: t)
#   end
# end

# Order ---------------------------------
# products = Product.all
#
# users.each do |user|
#   3.times do |i|
#     order = user.orders.create(
#       address_name: "東京太郎",
#       zip: "0010001",
#       address: "東京都東京区1-1-1",
#       tel: "08011112222",
#       paymethod: "代引",
#       bill: (i + 1) * 1000 + (i * 256)
#     )
#     3.times do |a|
#       order.order_items.create(
#         product_id: products[a].id,
#         product_name: products[a].name,
#         ordered_price: products[a].price,
#         quantity: a + 1
#       )
#     end
#   end
# end






