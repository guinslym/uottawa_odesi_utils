require 'spec_helper'

describe UottawaOdesiUtils do

  # Crappy specs start here
  describe ".DDI Documentation" do
     let(:lines) { UottawaOdesiUtils.retrieve_label_and_qstnlit(Dir.pwd+'/spec/data/esg-c-25.xml')}
     let(:b_lines) { UottawaOdesiUtils.bilingual_files(Dir.pwd+'/spec/data/esg-c-25.xml', 
                                                       Dir.pwd+'/spec/data/gss-c-25.xml')}

    it "expecting it to be at least 79" do
      expect(lines.size).to be >= 79
    end

    it "expecting it to return an Array" do
      expect(lines).to be_instance_of Array
    end

    it "expecting each element to be a Hash" do
      expect(lines.first).to be_instance_of Hash
    end

    it "expecing both file (fr+en) will create an Array of at least 79 elements" do
      expect(b_lines.size).to be >= 79
    end

  end


end
