require 'nokogiri'

module Jekyll
    module LinkFilter
        # Add rel="nofollow" and target="_blank" to all external URLs
        def autonofollow(input)
            content = Nokogiri::HTML.fragment(input)
            site_url = @context.registers[:site].config['url']
            content.css("a").each do |a|
                next unless a.get_attribute('href') =~ /\Ahttp/i
                next if a.get_attribute("href").start_with?(site_url)
                a['rel'] = "nofollow"
                a['target'] = "_blank"
            end
            content.to_s
        end

        # Replace anchor links (like <a href="#element-on-page">) with canonical versions, eg: https://example.com/page#element-on-page
        def toAbsoluteUrls(input, page_url)
            content = Nokogiri::HTML.fragment(input)
            content.css("a").each do |a|
                next unless a.get_attribute('href').start_with?('#')
                a['href'] = canonical(page_url) + a['href']
            end
            content.to_s
        end

        # Special fixes for Yandex.Turbo, because their parsers raise warnings
        def toYandexTurboContent(input)
            input.gsub(/(<!-- vim-markdown-toc.*<!-- vim-markdown-toc -->\n)/m, '')
            content = Nokogiri::HTML.fragment(input)
            # Remove anchor linking (like a href=#topic)
            content.css("a").each do |a|
                next unless a.get_attribute("href").start_with?('#')
                a.replace(a.content)
            end
            # Remove navbar (for custom pages, like mythic+)
            content.css("nav").each do |nav|
                nav.remove
            end
            content.to_s
        end

        # Canonicalize URL
        def canonical(input, prefix = '')
            unless input.nil?
                url = input.gsub('index.html','').gsub('amp/','/').gsub('.html','')
                @context.registers[:site].config['url'] + (@context.registers[:site].config['baseurl'] + (prefix ? '/' + prefix : '') + url).gsub('//','/')
            end
        end
    end
end

Liquid::Template.register_filter(Jekyll::LinkFilter)
