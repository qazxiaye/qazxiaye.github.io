#!/bin/sh
# The backslash makes the next line a comment in Tcl \
exec tclsh "$0" ${1+"$@"}

set url "http://qazxiaye.github.io"
cd public

set out [open sitemap.xml w+]
puts $out "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts $out "<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">"

proc WritePath {path} {
    global out url
    puts $out "  <url>"
    puts $out "    <loc>${url}${path}</loc>"
    puts $out "  </url>"
}

foreach f [exec find . -name \*.html] {
    WritePath [string range $f 1 end]
}

puts $out "</urlset>"
close $out
