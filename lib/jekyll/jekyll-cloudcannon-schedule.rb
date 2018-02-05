# frozen_string_literal: true

require "fileutils"

module Jekyll
  class FuturePostReader < Jekyll::PostReader
    def read_publishable(dir, magic_dir, matcher)
      future_posts = []
      read_content(dir, magic_dir, matcher).tap { |docs| docs.each(&:read) }
        .each do |doc|
          next unless doc.content.valid_encoding?
          site.publisher.publish?(doc).tap do |will_publish|
            if !will_publish && site.publisher.hidden_in_the_future?(doc)
              future_posts << doc
            end
          end
        end

      future_posts
    end
  end

  class JekyllCloudCannonSchedule < Jekyll::Generator
    safe true
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      @site = site
      @site.pages << schedule unless file_exists?("_schedule.txt")
    end

    private

    def source_path(file = "_schedule.txt")
      File.expand_path "../#{file}", __dir__
    end

    def future_posts
      FuturePostReader.new(@site).read_posts("")
    end

    def schedule
      schedule = PageWithoutAFile.new(@site, __dir__, "", "_schedule.txt")
      schedule.content = File.read(source_path)
      schedule.data["layout"] = nil
      schedule.data["future_posts"] = future_posts.map(&:to_liquid)
      schedule
    end

    # Checks if a file already exists in the site source
    def file_exists?(file_path)
      if @site.respond_to?(:in_source_dir)
        File.exist? @site.in_source_dir(file_path)
      else
        File.exist? Jekyll.sanitized_path(@site.source, file_path)
      end
    end
  end
end
