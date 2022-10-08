# frozen_string_literal: true
require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yaml)
    survey_arr = YAML.safe_load(yaml)
    @data = survey_arr.map(&:to_a)
  end

  def to_yaml
    @data.map(&:to_h).to_yaml
  end
end
