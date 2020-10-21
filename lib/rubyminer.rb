require "rubyminer/version"

module Rubyminer
  class Copier
    def self.copy
      copy_file "./lib/generators", "lib/generators"
      copy_file "./lib/templates", "lib/templates"
    end
  end

end