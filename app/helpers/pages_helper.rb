module PagesHelper
    def markdown(content)
      tag.artical data: { controller: "markdown-viewer" } do
        content
      end
    end
end
