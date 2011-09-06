require 'spec_helper'

describe ScriptletScanner::TemplateParser do
  %w[
    erb
  ].each do |template_ext|
    context "when parsing #{template_ext.upcase}s" do
      files = Dir[File.expand_path("../../templates/#{template_ext}/*.#{template_ext}", __FILE__)]
      last = files.size - 1
      files.each_with_index do |template, index|
        it "should parse #{File.basename(template).inspect}" do
          template_content, scriptlets, ruby_areas, has_syscalls = File.read(template).split(/\n#{'=' * 10}.*?\n/)
          ScriptletScanner::TemplateParser.should be_const_defined "#{template_ext.upcase}Parser"
          parser = ScriptletScanner::TemplateParser.const_get("#{template_ext.upcase}Parser")
          parse = parser.new.parse(template_content || "")
          parse.should_not be_nil
          # puts parse.inspect if index == last
          if scriptlets
            parse.scriptlets.join("\n\n").should be == scriptlets
          end
          if ruby_areas
            parse.ruby_areas.join("\n\n").should be == ruby_areas
          end
          if has_syscalls
            parse.has_system_call?.to_s.should be == has_syscalls
          end
        end
      end
    end
  end
end
