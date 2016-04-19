# Bootstrap your Alchemy sites

If you want to have different stylesheets loaded for different sites in AlchemyCMS this gem is a good fit for you.

# How to use the gem

To create a new site just run

```
$ rails g alchemy:site my_site
```

This will create a scss file in `app/assets/stylesheets/alchemy` with the name of your site. This file imports all site related css code from a folder that was created in the same directory for this particular site.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
