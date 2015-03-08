# UottawaOdesiUtils

This is a utils library to work with DDI-xml. The purpose of this library is to ease the process of translating variable label in a document. This library will retrieve the `<lbl>` and the `<qstnLit>` value of an IDD file and will also tell if the label.size is greater than 251 caracters, that will mean that it will be chopped in SPSS. So that it will be easy to create a json file, export it to a db for a Rails/Flask app. The python27 library can be found [here:pyodesi](http://www.github.com/guinslym)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uottawa_odesi_utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uottawa_odesi_utils

## Usage

Dealing with one Documentation file
```ruby
	content = retrieve_label_and_qstnlit('esg-cycle-xx.xml')
	pp content
	=> {:label=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning=>false, :variable_name=>"VARIABLE_000"}
```

Comparing to file
```ruby
	content = retrieve_label_and_qstnlit('esg-cycle-xx.xml')
	pp content
	=> {
	:label_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning_en=>false, 
	:variable_name=>"VARIABLE_000":label_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning_en=>false, 
	:variable_name=>"VARIABLE_000"}
```
Now it's easier to create a web app so that I can view the English and the French translation side-by-side and make corrections if the translation is not good enough or if the label size is greater than 251 character

##TODO
Flask/Sinatra app to put the json in a DB

## Contributing

1. Fork it ( https://github.com/guinslym/uottawa_odesi_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
