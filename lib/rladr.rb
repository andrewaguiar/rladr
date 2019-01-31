require 'active_support/all'
require 'rladr/version'
require 'rladr/initializer'
require 'rladr/new'

module Rladr
  def self.execute(args)
    unless args.any?
      puts <<~EOF
      Usage:
        rladr init [basedir]
        rladr new <Free text title>
      EOF

      exit
    end

    case args[0]
    when 'init'
      Rladr::Initializer.execute(args)
    when 'new'
      Rladr::New.execute(args.slice(1, args.length).join(' '))
    end
  end
end
