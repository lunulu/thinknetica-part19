# frozen_string_literal: true

# FormatTime
class FormatTime
  ALLOWED_FORMAT = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(format:)
    @format = format.split(',')
  end

  def time
    time = Time.now.strftime(ALLOWED_FORMAT.values_at(*@format).join('-'))
    ["#{time}\n"]
  end

  def invalid_format
    ["Unknown time format [#{@diff.join(', ')}]\n"]
  end

  def valid?
    @diff = @format.difference(ALLOWED_FORMAT.keys)
    @diff.empty?
  end
end
