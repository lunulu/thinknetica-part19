# frozen_string_literal: true

# App
class App
  # ALLOWED_FORMAT = [[year month day hour minute second], %w[%Y %m %d %H %M %S]]
  ALLOWED_FORMAT = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def call(env)
    headers = {
      'content-type' => 'text/plain'
    }

    req = Rack::Request.new(env)
    format = req.params['format'].split(',')

    diff = format.difference(ALLOWED_FORMAT.keys)
    return [400, headers, ["Unknown time format [#{diff.join(', ')}]\n"]] if diff.any?

    time = Time.now.strftime(ALLOWED_FORMAT.values_at(*format).join('-'))
    response = ["#{time}\n"]

    [200, headers, response]
  end
end
