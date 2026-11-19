# frozen_string_literal: true

module Jekyll
  module TagArchives
    class Archive < Jekyll::Page
      def initialize(site, tag, slug, lang, posts)
        @site = site
        @base = site.source
        prefix = lang == "pt-BR" ? "pt-br" : nil
        @dir = prefix ? File.join(prefix, "tag", slug) : File.join("tag", slug)
        @name = "index.html"
        translation_url = lang == "pt-BR" ? "/tag/#{slug}/" : "/pt-br/tag/#{slug}/"
        @data = {
          "layout" => "tag",
          "title" => tag,
          "lang" => lang,
          "translation_url" => translation_url,
          "posts" => posts,
        }
        @content = ""
        process(@name)
      end
    end

    class Generator < Jekyll::Generator
      safe true
      priority :low

      def generate(site)
        tags = Hash.new { |hash, key| hash[key] = [] }

        site.posts.docs.each do |post|
          lang = post.data["lang"] || site.config["lang"]
          Array(post.data["tags"]).each { |tag| tags[[lang, tag]] << post }
        end

        tags.sort_by { |(lang, tag), _| [lang, tag.downcase] }.each do |(lang, tag), posts|
          slug = Jekyll::Utils.slugify(tag, mode: "default")
          sorted_posts = posts.sort_by(&:date).reverse
          site.pages << Archive.new(site, tag, slug, lang, sorted_posts)
        end
      end
    end
  end
end
