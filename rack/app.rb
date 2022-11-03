# frozen_string_literal: true

require_relative 'format_time'

# App
class App
  def call(env)
    req = Rack::Request.new(env)
    formatter = FormatTime.new(format: req.params['format'])

    if formatter.valid?
      [200, {}, formatter.time]
    else
      [400, {}, formatter.invalid_format]
    end
  end
end
