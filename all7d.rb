# referers
# String                 | source_id | is_internal
# blizko                 | 1         | true
# yandex                 | 2         | false
# google                 | 3         | false
# mail                   | 4         | false
# др.поисковая система   | 5         | false
#                        | 6         | false
# Внутренний переход     | 7         | true
# Прямой переход         | 8         | false
#
# run: "ruby sc1.rb 12345 bz3 2.10.2016"

require 'yaml'
require_relative 'lib/controller.rb'

company_id = ARGV[0] # 12345
stand = ARGV[1] # bz3 pc1 yp2 ..
date = ARGV[2].nil? ? Date.today : Date.parse(ARGV[2]) # 11.10.2015 or 2017-03-21 or other parsable format

CONFIG = YAML.load_file("config/#{stand}.yml")
stand_link = CONFIG['stand_link']
product_listing_slug = CONFIG['p_listing_slug']

s = StatisticCreator.new(company_id, date)

dates = []
for i in 0..7 do
  dates.push(date - i)
end


pages = []
dates.each do |date|
  pages.push({page: '/', date: date})
end
pages.push({page: '/products/321-asd'})
pages.push({page: '/products/123-asd', subject_type: 'pt_pkt', subject_id: 123})
pages.push({page: "http://#{stand_link}/#{product_listing_slug}/010106-truba-obsadnaya}")

pages.each do |hash|
  s.pages(hash)
end


act = []
activities = CONFIG['activities']
i = 0
dates.each do |date|
  activities.each do |activ|
    i += 1
    act.push({action: activ, date: date, value: i})
  end
end

act.each do |hash|
  s.activities(hash)
end


referers = [
  {referer: 'String'},
  {referer: 'www.test3-blizko.ru'},
  {referer: 'www.yandex.ru', pages: 3},
  {referer: 'www.mail.ru', is_internal: true, source_id: 1},
  {referer: 'www.mail.ru'}
]

referers.each do |hash|
  s.referers(hash)
end


totals = [
  {yml_hits: 10, visits: 20, pages: 30}
]
dates.each do |date|
  totals.push({date: date, yml_hits: 1, visits: 3, pages: 5})
end

totals.each do |hash|
  s.totals(hash)
end


geo = []
cities = [10169, 10270, 10272, 10350]

cities.each do |city|
  dates.each do |date|
    geo.push({city_id: city, date: date, visits: 1, pages: 3})
  end
end

geo.each do |hash|
  s.geo(hash)
end