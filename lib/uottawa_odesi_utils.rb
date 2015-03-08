require "uottawa_odesi_utils/version"
require 'nokogiri'

module UottawaOdesiUtils

def self.retrieve_label_and_qstnlit(file)
	l = -> (name) { Nokogiri::XML(File.open("#{name}")) }
	doc = l.call(file)

	sentences = doc.children.css('dataDscr').children.search('var')

	node_found = []
	sentences.each do |sentence|

		x = -> (elem) {sentence.children.search("#{elem}")}
		label = x.call('qstnLit')
		qstnLit = x.call('labl')

		if label.text.size > 0 and qstnLit.text.size > 0
			label =  label.first.text.strip
			qstnLit =  qstnLit.first.text.strip
			label_warning = label.size > 251
			tmp = {label: label, qstnLit: qstnLit, label_warning: label_warning,
			 variable_name: sentence['name']}
			node_found.push(tmp)
		end
	end
	return node_found

end

def self.bilingual_files(xml_fr, xml_en)
	l = -> (name) { Nokogiri::XML(File.open("#{name}")) }
	doc = l.call(xml_fr)
	doc_other = l.call(xml_en)
  
	sentences = doc.children.css('dataDscr').children.search('var')

	idd_value = []
	sentences.each do |sentence|

		x = -> (elem) {sentence.children.search("#{elem}")}
		label = x.call('labl')
		qstnLit = x.call('qstnLit')

		if label.text.size > 0 and qstnLit.text.size > 0
			variable_name = sentence['name'] 
			label_fr =  label.first.text.strip
			qstnLit_fr =  qstnLit.first.text.strip
			label_warning_fr = label_fr.size > 251

			#other language
			var =  doc_other.children.css("var[@name=#{variable_name}]")

      #if this French Node is not Present in the English file, than I'll leave it blank
      begin
      	b = -> (elem) { var.children.search("#{elem}").first.text.strip }
			  label_en= b.call('labl')
			  qstnLit_en= b.call('qstnLit')
			rescue
			  label_en= ""
			  qstnLit_en= ""
			end

			tmp = {variable_name: variable_name, label_en: label_en, qstnLit_en: qstnLit_en, 
				label_warning_en: label_en.size > 251, label_fr: label_fr, qstnLit_fr: qstnLit_fr,
				label_warning_fr: label_fr.size > 251}
			#puts tmp
			idd_value.push(tmp)
		end
	end
	return idd_value

  end#bilingual_files

end#module
