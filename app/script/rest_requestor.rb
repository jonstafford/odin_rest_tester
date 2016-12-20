require 'rest-client'


paths = ["users", "users/new", "users/1/edit", "users/2"]

path_prefix = "http://localhost:3000/"

paths.each do |p|
  url = path_prefix + p
  resp = RestClient.get(url)
  lines = resp.split("\n")
  
  last_lines = lines[-5..-1]
  
  last_lines.unshift("*** #{url} ***".upcase)
  
  last_lines.each { |l| puts l }
end



url = path_prefix + "users"

resp = RestClient.post(url, "")

