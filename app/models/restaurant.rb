# -*- encoding: utf-8 -*-
class Restaurant < ActiveResource::Base
  self.site = "https://godofmeal.herokuapp.com"
  class Format
    include ActiveResource::Formats::JsonFormat
    def decode(json)
      super(json)
    end
  end

  self.format = Format.new
  def self.restaurant(id,latitude,longitude)
    self.find(:one, from: "/api/restaurant/search", params: { terminal_id: id, latitude: latitude, longitude: longitude} )
  end

  def self.restaurant_search(id,latitude,longitude)
    rs = restaurant(id,latitude,longitude)
    list = Hash::new
    list['name'] = rs.name
    list['category'] = rs.category
    list['mobile'] = rs.url_mobile
    list['address'] = rs.address
    list['tel'] = rs.tel
    list['image'] = rs.image_url
    return list
  end
end
