require 'date'

module Rladr
  module New
    class << self
      def execute(title)
        path = File.read('.rladr')
        id = next_id(path)

        filename = note_filename(id, path, title)
        File.write(filename, note_content(id, title))

        puts ":: Created #{filename}"
      end

      def next_id(path)
        ids = Dir["./#{path}/*.md"].map do |filename|
          filename
            .split('/')
            .last
            .split('-')
            .first
            .to_i
        end

        (ids + [0]).max + 1
      end

      def note_filename(id, path, title)
        "#{path}/#{"%05d" % id}-#{title.parameterize}.md"
      end

      def note_content(id, title)
        <<~STR
          # #{id}. #{title}

          Date: #{Date.today.to_s}

          ## Status

          Accepted

          ## Context

          TODO

          ## Decision

          TODO

          ## Consequences

          TODO
        STR
      end
    end
  end
end
