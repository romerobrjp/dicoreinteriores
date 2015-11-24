# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'images')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( admin/application.js admin/application.css )
Rails.application.config.assets.precompile << Proc.new { |path| path =~ /(bootstrap|font-awesome)/ and File.extname(path).in?(['.otf', '.eot', '.svg', '.ttf', '.woff', '.woff2']) }
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
