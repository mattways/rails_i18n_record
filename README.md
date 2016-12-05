[![Gem Version](https://badge.fury.io/rb/translatable_records.svg)](http://badge.fury.io/rb/translatable_records)
[![Code Climate](https://codeclimate.com/github/mmontossi/translatable_records/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/translatable_records)
[![Build Status](https://travis-ci.org/mmontossi/translatable_records.svg)](https://travis-ci.org/mmontossi/translatable_records)
[![Dependency Status](https://gemnasium.com/mmontossi/translatable_records.svg)](https://gemnasium.com/mmontossi/translatable_records)

# Translatable Records

Fully customizable record translations for rails.

## Why

I did this gem to:

- Have the freedom to customize the translation model.
- Avoid duplication by delegate translatable attributes directly to translation model.
- Use translations other than I18n.available_locales.

## Install

Put this line in your Gemfile:
```ruby
gem 'translatable_records'
```

Then bundle:
```
$ bundle
```

## Configuration

Define wich attributes will be translatable with the attr_translatable in your models:
```ruby
attr_translatable :attr
```

Generate the translation model and migration for them:
```
$ bundle exec rails g translation model
```

Complete the migrations adding the columns for each field in the translatations tables:
```ruby
add_column :model_translations, :attr, :string
```

Remove the original column from models table:
```ruby
remove_column :models, :attr
```

Update your db:
```
$ bundle exec rake db:migrate
```

## Usage

If you want to change the locale to something different than I18n.locale:
```ruby
record.with_locale :es
```

If you want to build a translation for each available locale:
```ruby
record.build_translations
```

If you want to save multiple translations:
```erb
<%= f.fields_for :translations do |ff| %>
  <%= ff.hidden_field :locale %>
  <%= ff.label :attr %>
  <%= ff.text_field :attr %>
<% end %>
```

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
