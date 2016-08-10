#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'


column_header = 'النائب'
ar_names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://ar.wikipedia.org/wiki/مجلس_النواب_اللبناني',
  after: '//h2[contains(.,"2009")]',
  xpath: '//table[.//td[contains(.,"%s")]]//td[2]//a[not(@class="new")]/@title' % column_header,
)

en_names  = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/lebanese-parliament-2009', column: 'wikiname')

en_names2 = WikiData::Category.new( 'Category:Members of the Parliament of Lebanon', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en_names | en_names2, ar: ar_names }, output: false)
