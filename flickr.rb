require 'flickraw'

FlickRaw.api_key="283e0a4e57206eb665d434476bb068f7"
FlickRaw.shared_secret="b23dc3d08e3eba64"

token = flickr.get_request_token
auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

puts "Open this url in your process to complete the authication process : #{auth_url}"
puts "Copy here the number given when you complete the process."
verify = gets.strip

begin
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  login = flickr.test.login
  puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
rescue FlickRaw::FailedResponse => e
  puts "Authentication failed : #{e.msg}"
end