#!/bin/env ruby
# encoding: utf-8

require 'pry'
require 'wikidata/fetcher'

en_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/lebanese-parliament-2009', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(names: { en: en_names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
