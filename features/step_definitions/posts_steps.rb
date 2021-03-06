When /^I click share across aspects$/ do
  find("#expand_publisher").click
end

When /^I post a photo with a token$/ do
  json = JSON.parse <<JSON
        {"activity":{"actor":{"url":"http://cubbi.es/daniel","displayName":"daniel","objectType":"person"},"published":"2011-05-19T18:12:23Z","verb":"save","object":{"objectType":"photo","url":"http://i658.photobucket.com/albums/uu308/R3b3lAp3/Swagger_dog.jpg","image":{"url":"http://i658.photobucket.com/albums/uu308/R3b3lAp3/Swagger_dog.jpg","width":637,"height":469}},"provider":{"url":"http://cubbi.es/","displayName":"Cubbi.es"}}}
JSON
  page.driver.post(activity_streams_photos_path, json.merge!(:auth_token => @me.authentication_token))
end
