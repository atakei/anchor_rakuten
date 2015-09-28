# encoding: utf-8
#
# This is a sample script f Rakuten Books APIs.
# RWS Ruby SDK supports Books API. The inteface is similar to ones Ichiba API.
# If you want to search CDs dealt in Rakuten Books, you can do it with `RakutenWebService::Books::CD`.
# As for other resources, there are `RakutenWebService::Books::Book`, `RakutenWebService::Books::DVD` and so on.
# Please refer to the following documents if you want more detail of input/output parameters:
#   http://webservice.rakuten.co.jp/document/
#
require 'sinatra'
require 'rakuten_web_service'

get '/' do

  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
  end

  books = RakutenWebService::Books::Book.search(:title => 'Rails')

@rankings = books.first(10)

erb :item_ranking

end
