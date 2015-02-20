module OpenGraph
  @@tags = []
  
  def self.add_meta_tag(property, content)
    @@tags.push({ :property => property, :content => content })
  end
  
  def self.remove_meta_tag(property)
    @@tags.delete_if { |i| i[:property] == property }
  end
  
  def self.render_meta_tags
    result = []
    @@tags.each do |tag|
      result.push ['<meta property="og:',tag[:property],'" content="',tag[:content],'">'].join('')
    end
    @@tags = []
    result.join("\n").html_safe
  end
end
