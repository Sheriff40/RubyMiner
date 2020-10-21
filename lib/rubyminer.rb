require "rubyminer/version"

module Rubyminer
  class Copier
    def self.copy
      FileUtils.cp_r 'https://github.com/Sheriff40/ruby_miners_template/', 'lib/generators'
      copy_file "./lib/templates", "lib/templates"
    end
  end

end