require "yaml"
require "pry"
#emoticons = YAML.load_file("./lib/emoticons.yml")

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  emoticons.each do |meaning, emoticon_array|
    if new_hash["get_meaning"] && new_hash["get_emoticon"]
      new_hash["get_meaning"][emoticon_array[1]] = meaning
      new_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]      
    else
      new_hash["get_meaning"] = {emoticon_array[1] => meaning}
      new_hash["get_emoticon"] = {emoticon_array[0] => emoticon_array[1]}
    end 
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash["get_emoticon"][emoticon]
    emoticons_hash["get_emoticon"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash["get_meaning"][emoticon]
    emoticons_hash["get_meaning"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end