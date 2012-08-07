require 'date'
require 'rujitsu'
require 'active_support/core_ext/integer/inflections'

def rsync location
  exec %{rsync -glpPrtvz --chmod=ug=rwX,o=rX -e "ssh" --exclude=".git" "#{Dir.pwd}/output/" #{location}}
end
  
task "deploy" do
  `chmod -Rfv 777 content`
  rsync "michelle@michelleamanda.co.uk:/home/michelle/michelleamanda.co.uk"
end

task "create_post" do
  title = ENV['title']
  path = "content/#{Date.today.year}/#{Date.today.strftime "%m"}"
  file = "#{path}/#{title.to_url}.html"
  `mkdir -p #{path}`
  `touch #{file}`  
  content = %{---
title: "#{title}"
kind: article
layout: post
categories:
- 
tags:
- 
created_at: #{Date.today.strftime "#{Date.today.day.ordinalize} %B %Y"}
author: Michelle Amanda
---
}
  `echo "#{content}" >> #{file}`
end