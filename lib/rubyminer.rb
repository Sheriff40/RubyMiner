require "rubyminer/version"

module Rubyminer
  class Copier
    def self.copy
      FileUtils.cp_r "/home/sheriff/Desktop/rubyminer/lib/generators", 'lib/generators'
      FileUtils.cp_r "/home/sheriff/Desktop/rubyminer/lib/templates", 'lib/templates'
    end
  end
end