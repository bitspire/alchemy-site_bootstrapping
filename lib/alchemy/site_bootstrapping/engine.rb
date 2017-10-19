module Alchemy
  module SiteBootstrapping

    class Engine < Rails::Engine

      # Collecting stylesheets in app/assets/stylesheets
      initializer "alchemy.assign_stylesheets_for_sites" do |app|
        app.config.stylesheets_for_alchemy_sites =
          Dir.glob(File.join(Rails.root, "app/assets/stylesheets/*.scss"))
      end

      # Stylesheets defined for Sites will be precompiled.
      initializer 'alchemy.stylesheets_for_sites_to_precompile' do |app|
        app.config.stylesheets_for_alchemy_sites.each do |file_path|
          app.config.assets.precompile << "#{File.basename(file_path, '.scss')}.css"
        end
      end

      # Collecting javascripts in app/assets/javascripts
      initializer "alchemy.assign_javascripts_for_sites" do |app|
        app.config.javascripts_for_alchemy_sites =
          Dir.glob(File.join(Rails.root, "app/assets/javascripts/*.js"))
      end

      # Javascripts defined for Sites will be precompiled.
      initializer 'alchemy.javascripts_for_sites_to_precompile' do |app|
        app.config.javascripts_for_alchemy_sites.each do |file_path|
          app.config.assets.precompile << "#{File.basename(file_path, '.js')}.js"
        end
      end

      # Make helper methods available to use correct stylesheet for each particular site
      initializer "alchemy.sitebootstrapping.view_helpers" do
        ActionView::Base.send :include, ViewHelpers
      end
    end

  end
end
