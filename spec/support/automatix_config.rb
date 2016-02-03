module Automatix
  def self.config
    return @config if @config

    path = "config/settings.yml"
    @config = Config.new(path)
  end

  class Config
    def initialize(path)
      @path = path
      eigenclass = (class << self; self; end)
      set_field_accessors(YAML.load_file(@path), eigenclass)
    end

    def [](key)
      self.send(key)
    end

    private

    def set_field_accessors(fields, eigenclass)
      fields.symbolize_keys!
      fields.each do |key, value|
        instance_variable_set("@#{key}", value)
        eigenclass.send(:attr_reader, key)
      end
    end
  end
end
