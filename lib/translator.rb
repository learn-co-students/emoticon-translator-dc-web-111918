# require modules here
require "pry"
require "yaml"


def load_library(path)
  lib = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |key, value|
    eng, jap = value
    lib["get_emoticon"][eng] = jap
    lib["get_meaning"][jap] = key
  end
  lib
end

def get_japanese_emoticon(yamlPath, emoticon)
  lib = load_library(yamlPath)
  finding = lib["get_emoticon"][emoticon]
  if finding
    finding
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end

def get_english_meaning(yamlPath, emoticon)
  lib = load_library(yamlPath)
  finding = lib["get_meaning"][emoticon]
  if finding
    finding
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end
