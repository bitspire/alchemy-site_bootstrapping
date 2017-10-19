require 'rails'

module Alchemy
  module Generators
    class SiteGenerator < ::Rails::Generators::Base
      desc "This generator generates your site and its corresponding asset structure."
      argument :site_name, banner: "Site-Name"
      argument :site_host, banner: "site-host.com"
      source_root File.expand_path('templates', File.dirname(__FILE__))

      def init
        @site_name = site_name
        @parameterized_site_name = site_name.parameterize
        @site_host = site_host
      end

      def create_site
        site = Alchemy::Site.find_or_initialize_by(name: @site_name, host: @site_host)
        if site.persisted?
          puts "Site #{@site_name} already exists. Skipping creation of Site."
        else
          site.save!
          puts "Created Site #{@site_name} (unpublished)."
        end
      end

      def create_stylesheets
        puts "Creating directories and files for site related stylesheets..."
        root_css_dir = "#{Rails.root}/app/assets/stylesheets"
        namespaced_site_dir = "#{root_css_dir}/alchemy/sites/#{@parameterized_site_name}"
        empty_directory namespaced_site_dir
        template "site.scss", "#{root_css_dir}/#{@parameterized_site_name}.scss"
        template "_variables.scss", "#{namespaced_site_dir}/_variables.scss"
      end

      def create_javascripts
        puts "Creating directories and files for site related javascripts..."
        root_js_dir = "#{Rails.root}/app/assets/javascripts"
        empty_directory "#{root_js_dir}/alchemy/sites/#{@parameterized_site_name}"
        template "site.js", "#{root_js_dir}/#{@parameterized_site_name}.js"
      end

    end
  end
end
