# frozen_string_literal: true

module Jekyll
  module TagArchives
    class Archive < Jekyll::Page
      def initialize(site, tag, slug, docs)
        @site = site
        @base = site.source
        @dir  = File.join("tag", slug)
        @name = "index.html"
        @data = {
          "layout" => "tag",
          "title"  => tag,
          "posts"  => docs,
        }
        @content = ""
        process(@name)
      end
    end

    class TagArchivesGenerator < Jekyll::Generator
      safe true
      priority :low

      def generate(site)
        tags = Hash.new { |hash, key| hash[key] = [] }

        docs_for(site).each do |doc|
          Array(doc.data["tags"]).each { |tag| tags[tag] << doc }
        end

        tags.sort_by { |tag, _| tag.downcase }.each do |tag, docs|
          slug = Jekyll::Utils.slugify(tag, mode: "default")
          sorted = docs.sort_by { |doc| doc.date }.reverse
          site.pages << Archive.new(site, tag, slug, sorted)
        end
      end

      private

      def docs_for(site)
        docs = site.posts.docs.dup
        site.collections.each_value do |collection|
          next if collection.label == "posts"
          next unless collection.write?

          docs.concat(collection.docs)
        end
        docs
      end
    end
  end
end
