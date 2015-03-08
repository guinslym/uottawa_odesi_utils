# UottawaOdesiUtils

Ceci est une librairie pour agir en tant que Helper pour travailler avec les Documentations xml d'Odesi. Le logiciel SPPS va abrégé toutes les phrases qui ont une taille plus grande que  251 caractères. Le but de cette libraire est de rendre plus facile de faire la traduction des `<labl>` et des balises `<qstnLit>` en créant un hash des valeurs des balises. Ensuite je pourrai savoir quel `<labl>` sera écourté en examinant la taille totale de caractères contenu dans cette balise et utilisé une application comme Rails/sinatra pour faire la traduction ou pour modifier la pharse écourtée par SPSS.

This is an utils library to work with DDI-xml. The purpose of this library is to ease the process of translating variable label in a document. This library will retrieve the `<labl>` and the `<qstnLit>` value of an IDD file and will also tell if the label.size is greater than 251 caracters, that will mean that it will be chopped in SPSS. So that it will be easy to create a json file, export it to a db for a Rails/Flask app. The python27 library can be found [here:pyodesi](http://www.github.com/guinslym)

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
	puts content
	=> {:label=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning=>false, :variable_name=>"VARIABLE_000"}
```

Comparing two files
```ruby
	content = bilingual_files('esg-cycle-xx_fr.xml', 'gss-cycle-xx_en.xml')
	#french file must be first
	puts content
	=> {
	:label_fr=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit_fr=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning_fr=>false, 
	:variable_name=>"VARIABLE_000":label_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
	:qstnLit_en=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
	:label_warning_en=>false, 
	:variable_name=>"VARIABLE_000"}
```
Now it's easier to create a web app so that I can view the English and the French translation side-by-side and make corrections if the translation is not good enough or if the label size is greater than 251 character

##TODO
Sinatra app to put the json in a DB

## Contributing

1. Fork it ( https://github.com/guinslym/uottawa_odesi_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
