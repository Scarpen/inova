json.array!(@securities) do |security|
  json.extract! security, :id, :type_of_security
  json.url security_url(security, format: :json)
end
