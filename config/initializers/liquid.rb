template_path = Rails.root.join('app/views/shared')
Liquid::Template.file_system = Liquid::LocalFileSystem.new(template_path) 