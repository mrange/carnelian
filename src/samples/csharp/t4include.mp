@@@ metaprogram
@@@ extension cs
@@@ require net/http
@@@ require net/https
@@@ require uri
@@@ require ostruct
@@> # TODO
@@> # 1. Use VERIFY_PEER
@@> # 2. Handle 301, redirects, raw.github.com
@@>
@@> seen_includes   = {}
@@>
@@> current_urls    = $t4include.get :includes  , []
@@>
@@> blacklist       = $t4include.get :blacklist , []
@@>
@@> base_uri        = URI $root_path
@@>
@@> https_options   = {use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE}
@@> http_options    = {}
@@> options         = base_uri.scheme == "https" ? https_options : http_options
@@>
@@> includes        = []
@@> logs            = []
@@>
@@> Net::HTTP.start base_uri.host, base_uri.port, options do |http|
@@>     while current_urls.length > 0
@@>         for inc in current_urls
@@>             logs << '// @@@ INCLUDE: %s' % inc
@@>             is_blacklisted  = (blacklist.select do |bl| bl =~ inc end).length > 0
@@>             if is_blacklisted
@@>                 logs << '// @@@ BLACKLISTED: %s' % inc
@@>                 next
@@>             end
@@>
@@>             uri             = URI.join base_uri, inc
@@>             key             = uri.to_s.downcase
@@>             is_seen         = seen_includes.has_key? key
@@>             if is_seen
@@>                 logs << '// @@@ ALREADY_SEEN: %s' % inc
@@>                 next
@@>             end
@@>
@@>             seen_includes[key] = true
@@>
@@>             content = http.get uri.request_uri
@@>
@@>             base_url        = File.dirname inc
@@>
@@>             data            = OpenStruct.new
@@>             data.lines      = []
@@>             data.defines    = []
@@>             data.next_urls  = []
@@>
@@>             body            = content.body.force_encoding 'utf-8'
@@>
@@>             body.each_line do |line|
@@>                 handled = false
@@>
@@>                 for match in $matches
@@>                     match_data = match.regexp.match line
@@>                     if match_data != nil then
@@>                         match.processor.call match_data, base_url, data
@@>                         handle = true
@@>                         break
@@>                     end
@@>                 end
@@>
@@>                 data.lines << line unless handled
@@>             end
@@>
@@>             includes << data
@@>
@@>             current_urls    = data.next_urls
@@>         end
@@>     end
@@>
@@>     for log in logs
@@>         document.write log
@@>         document.new_line
@@>     end
@@>     for inc in includes
@@>         for define in inc.defines
@@>             define.rtrim!
@@>             document.write define.rstrip!
@@>             document.new_line
@@>         end
@@>         for line in inc.lines
@@>             document.write line.rstrip!
@@>             document.new_line
@@>         end
@@>     end
@@> end

@@+ class Hash
@@+     def get (key, defaultValue=nil)
@@+         value = self[key]
@@+         return value unless value == nil
@@+         return defaultValue || ("KEY_'%s'_NOT_FOUND" % key.to_s)
@@+     end
@@+ end
@@+
@@+ def make_match (regexp, &processor)
@@+     os = OpenStruct.new
@@+     os.regexp       = regexp
@@+     os.processor    = processor
@@+     return os
@@+ end
@@+
@@+ $match_include  = make_match (/^\s*\/\/ ### INCLUDE:\s*(?<filename>\S+)\s*$/) \
@@+                     do |match, base_url, data|
@@+                         filename = match["filename"]
@@+                         url = "%s/%s" % [base_url, filename]
@@+                         data.next_urls << url
@@+                     end
@@+ $match_define   = make_match (/^\s*#\s*define\s+(?<define>\S+)\s*$/) \
@@+                     do |match, base_url, data|
@@+                         data.defines << match[0]
@@+                     end
@@+
@@+ $matches        =
@@+     [
@@+         $match_include  ,
@@+         $match_define   ,
@@+     ]
