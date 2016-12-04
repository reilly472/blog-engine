class DbFileSystem
  def read_template_file(template_path, context)
    Snippet.find_by(code: template_path).body
  end
end