require 'pathname'

module FileHelpers
  def filepath(year:, day:, filename:)
    File.readlines(Pathname.new("spec/fixtures/#{year}/#{day}/#{filename}"))
  end
end
