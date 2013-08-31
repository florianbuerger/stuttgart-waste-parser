# encoding: UTF-8

require 'optparse'
require 'nokogiri'
require 'open-uri'
require 'icalendar'
require 'date'
require 'uri'

options = {
  :outfile => File.join(ENV['HOME'],'Desktop/waste.ics')
}

OptionParser.new do |opts|
  opts.banner = "Usage: #{ __FILE__ } [options]"

  opts.on('-z', '--zipcode ZIPCODE', Integer, 'Your zipcode') do |zipcode|
    options[:zipcode] = zipcode
  end

  opts.on('-s', '--street STREET', 'Your street') do |street|
    options[:street] = street
  end

  opts.on('-o', '--outfile FILE', 'The file to write to') do |file|
    options[:outfile] = file
  end
end.parse!

url = URI.escape("https://www.sita-deutschland.de/loesungen/privathaushalte/abfuhrkalender/stuttgart.html?plz=#{ options[:zipcode] }&strasse=#{ options[:street] }")
doc = Nokogiri::HTML(open(url))

events = []

class String
  def squash
    self.length < 2 ? nil : self
  end
end

year = doc.xpath('//*[@id="c191"]/div/div/table/thead/tr/td/strong').text.split.last
entries = doc.xpath('//*[@id="c191"]/div/div/table/tbody/tr')
entries.each do |entry|
  events << entry.css('td')[1].text.split.last
  events << entry.css('td')[2].text.split.last.squash
end

cal = Icalendar::Calendar.new

events.compact.each do |entry|
  cal.event do
    dtstart Date.strptime(entry,'%d.%m.%Y')
    summary 'Gelber Sack wird abgeholt'
    alarm do
      summary 'Gelber Sack wird morgen abgeholt'
      action 'DISPLAY'
      trigger '-PT5H0M0S'
    end
  end
end

cal_file = File.new(options[:outfile], 'w')
cal_file.write(cal.to_ical)
cal_file.close
