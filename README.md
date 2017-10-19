# Bootstrap your Alchemy sites

This gem allows you to use different stylesheets and javascripts for each of your alchemy sites.

If you are running a multi-site environment with Alchemy CMS and you want to make those sites look and bwehave different from each other, this gem is a good fit for you.

# How to use the gem

1. The gem provides a site generator which creates the site in your database and also generates the manifest files for the site specific stylesheets and javascripts.

Create a new site

```
$ rails g alchemy:site blog localhost
```

The generator will create a new site called blog that runs on localhost.

It also creates a CSS manifest file `app/assets/stylesheets/blog.scss`. By default this file imports all files from `app/assets/stylesheets/alchemy/sites/blog/` folder and will be considered to be precompiled in production.

It also creates a Javascript manifest file `app/assets/javascripts/blog.js`. By default this file requires all files from `app/assets/javascripts/alchemy/sites/blog/` folder and will be considered to be precompiled in production.


2. The gem also provides view helpers to render the right stylesheet or javascript in your layout. If for whatever reason it can not find the right file it will fall back to `application.js/css`.


To render site specific stylesheets simply pass `stylesheet_for_current_site`  to `stylesheet_link_tag`.

```
<%= stylesheet_link_tag stylesheet_for_current_site, media: 'all' %>
```

To render site specific javascripts simply pass `javascript_for_current_site` to `javascript_include_tag`.

```
<%= javascript_include_tag javascript_for_current_site %>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
