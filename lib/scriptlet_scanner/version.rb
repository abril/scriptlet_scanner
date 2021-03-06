module ScriptletScanner
  module VERSION #:nodoc:
    version = nil
    version = $1 if ::File.expand_path('../..', __FILE__) =~ /\/scriptlet_scanner-(\d[\w\.]+)/
    version_file = ::File.expand_path('../../../GEM_VERSION', __FILE__)
    version = File.read(version_file) if version.nil? && ::File.exists?(version_file)
    if version.nil? && ::File.exists?(::File.expand_path('../../../.git', __FILE__))
      version = ::StepUp::Driver::Git.new.last_version_tag("HEAD", true) rescue "v0.0.0+0"
      ::File.open(version_file, "w"){ |f| f.write version }
    end

    STRING = version.gsub(/^v?([^\+]+)\+?\d*$/, '\1')
    MAJOR, MINOR, PATCH, TINY = STRING.scan(/\d+/)

    def self.to_s
      STRING
    end
  end
end
