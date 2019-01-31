require 'date'
require 'fileutils'

module Rladr
  module Initializer
    class << self
      def execute(args)
        basedir = args.length > 1 ? args[1] : 'adrs'

        FileUtils.mkdir_p("./#{basedir}")
        File.write('.rladr', basedir)

        puts ":: Initialized in #{basedir}"

        Rladr::New.execute('Record architecture decisions')
      end
    end
  end
end
