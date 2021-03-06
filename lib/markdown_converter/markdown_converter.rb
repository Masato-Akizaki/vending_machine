class Markdown_Converter

  def convert_markdown(markdown)
    markdown.split("\n").map { |line| convert_line(line) }.join("\n")
  end

  def convert_line(text)
    if text.start_with? "#"
      hashes, text = text.split(" ", 2)
      "<h#{hashes.length}>#{convert_text(text)}</h#{hashes.length}>"
    elsif text.start_with? "-"
      _, text = text.split(" ", 2)
      "<li>#{convert_text(text)}</li>"
    else
      "<p>" + convert_text(text) + "</p>"
    end
  end

  def convert_text(text)
    text.gsub("**").each_with_index { |_, i| "<#{"/" if i.odd?}strong>" }
  end
end

converter = Markdown_Converter.new
input_filename = ARGV[0]
output_filename = ARGV[1]
markdown = File.read(input_filename)
output = converter.convert_markdown(markdown)
File.write(output_filename, output)
puts "Converted #{input_filename} (#{markdown.lines.count} lines) to #{output_filename} (#{output.lines.count} lines)"