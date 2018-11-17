# require modules here
require 'yaml'

def load_library(file_path)
  library = {"get_meaning" => {} , "get_emoticon" => {}}
  YAML.load_file(file_path).each do |meaning, emoticon|
    eng, jpn = emoticon
    library["get_meaning"][jpn] = meaning
    library["get_emoticon"][eng] = jpn
  end #yaml each
  return library
end #method

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  translation = library["get_emoticon"][emoticon]
    if translation
      return translation
    else
      "Sorry, that emoticon was not found"
    end #if end
end #method

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  eng_meaning = library["get_meaning"][emoticon]
  if eng_meaning
    return eng_meaning
  else
    "Sorry, that emoticon was not found"
  end #if
end #method
