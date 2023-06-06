class ApplicationController < Sinatra::Base
set :default_content_type, "application/json"
  # add routes
get "/bakeries" do
  barkeries = Bakery.all
  barkeries.to_json(only:[:id,:name])
end

get "/bakeries/:id" do
  bakery = Bakery.find(params[:id])
  bakery.to_json(only:[:id,:name],include:{baked_goods:{only:[:id,:name,:price, :bakery_id]}})
end

get "/baked_goods/by_price" do
   goods= BakedGood.all.order(price: :desc)
   goods.to_json

end

get "/baked_goods/most_expensive" do
  goods= BakedGood.all.order(price: :desc ).limit(1)
  goods.to_json(only: [:name, :price])

end
end
