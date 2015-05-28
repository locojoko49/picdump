# included libraries
require 'rbconfig'
require 'nokogiri'
require 'uri'

module Detect
	def detect_wd
		unless Dir.pwd.nil?
			return Dir.pwd.to_s
		else
			return ""
		end
	end

  def detect_os
    os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        :windows
      when /darwin|mac os/
        :macosx
      when /linux/
        :linux
      when /solaris|bsd/
        :unix
      else
        raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
    )
    return os.to_s if os
  end
	
	def detect_path path
		if (path.include? "/" or path.include? "\\") \
			and not (path.include? "\\\\" or path.include? "//")
			return path
		else
			return ""
		end
	end
	
	def detect_web addr
		if /\A#{URI::regexp}\z/ =~ addr
			return addr
		else
			return ""
		end
	end
end
