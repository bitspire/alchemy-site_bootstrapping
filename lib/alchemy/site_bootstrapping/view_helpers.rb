module Alchemy
  module SiteBootstrapping
    module ViewHelpers

      # In your layout file use this view helper to render the stylesheet for the currently requested site
      # Usage: `stylesheet_link_tag stylesheet_for_current_site, media: 'all'`
      def stylesheet_for_current_site
        site_has_stylesheet?(current_site_name) ? current_site_name.parameterize : "application"
      end

      def site_has_stylesheet?(site_name)
        stylesheets = Rails.application.config.stylesheets_for_alchemy_sites
        stylesheets.map { |f| File.basename(f) }.include? "#{site_name.parameterize}.scss"
      end

      # In your layout file use this view helper to render the javascript for the currently requested site
      # Usage: `javascript_include_tag javascript_include_tag`
      def javascript_for_current_site
        site_has_javascript?(current_site_name) ? current_site_name.parameterize : "application"
      end

      def site_has_javascript?(site_name)
        javascripts = Rails.application.config.javascripts_for_alchemy_sites
        javascripts.map { |f| File.basename(f) }.include? "#{site_name.parameterize}.js"
      end

      def current_site_name
        @current_site_name ||= Alchemy::Site.current.name
      end

      def favicon_path(filename)
        asset_path "favicon/#{current_site_name.parameterize}/#{filename}"
      end
    end
  end
end
