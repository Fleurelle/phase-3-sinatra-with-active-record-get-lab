require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # binding.pry 
    bakeries = Bakery.all 
    bakeries.to_json 
  end

  get '/bakeries/:id' do
    # binding.pry
    bakeries_id = Bakery.find(params[:id])
    bakeries_id.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
    # binding.pry
    bakeries_by_price = BakedGood.all.order(price: :desc)
    bakeries_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    # binding.pry
    expensive_baked_good = BakedGood.all.order(price: :desc).first
    expensive_baked_good.to_json
  end

end
