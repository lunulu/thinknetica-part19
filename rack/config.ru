# frozen_string_literal: true

require 'rack'
require_relative 'app'

app = Rack::Builder.new do
  map '/time' do
    run App.new
  end

  run ->(env) { [404, {}, []] }
end

run app
