class SnippetDrop < Liquid::Drop
    def initialize
        @snippet = Snippet.first
    end
    
    def body
        @body = @snippet.body
    end
end