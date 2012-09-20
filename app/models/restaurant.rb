# -*- encoding: utf-8 -*-
class Restaurant < ActiveResource::Base
  self.site = "https://godofmeal.herokuapp.com"

  self.format = :json

  def self.restaurant(id, latitude, longitude)
    self.find(:one, from: "/api/restaurant/search",
              params: { terminal_id: id,
                        latitude: latitude,
                        longitude: longitude })
  end

  def self.restaurant_search(id,latitude,longitude)
    rs = restaurant(id,latitude,longitude)
    {name: rs.name, category: rs.category, mobile: rs.url_mobile,
     address: rs.address, tel: rs.tel, image: rs.image_url}
  end
end
