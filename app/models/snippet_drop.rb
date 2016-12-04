class SnippetDrop < Liquid::Drop
    def before_method(method)
        @snippet = Snippet.find_by(code: method)
    end
    
    def body
        @body = @snippet.body
    end
end