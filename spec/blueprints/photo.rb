Photo.blueprint do
  name
  photo File.open("#{RAILS_ROOT}/spec/fixtures/red-ball.jpg")
end