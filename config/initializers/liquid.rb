#template_path = Rails.root.join('app/views/snippets')
Liquid::Template.file_system = DbFileSystem.new #Liquid::LocalFileSystem.new(template_path) 