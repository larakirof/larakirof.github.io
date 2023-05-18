
module Filter
  def self.jsondata(site, payload)
    json = []
    site.data["larakirof"].each do |w|
      found = false
      cat = nil
      json.each_with_index do |j,i|
        if j.keys.first == w["Category"]
          found = true
          cat = json[i]
        end
      end
      if not found
        json << {w["Category"]=>[]}
        cat = json[-1]
      end
      found = false
      cat.values.first.each_with_index do |j,i|
        if j.keys.first == w["Address"]
          found = true
          cat.values.first[i][w["Address"]] << w
        end
      end
      if not found
        cat.values.first << {w["Address"]=>[w]}
      end
    end
    File.open("#{Dir.pwd}/assets/js/data.js","w") do |f|
      f.write("var works = #{json.to_json}")
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site, payload|
  puts "#{Dir.pwd}"
  Filter.jsondata(site, payload)
end
