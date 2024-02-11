#!/usr/bin/env ruby

require 'date'
require 'pp'
require 'io/console'

class Entry
  attr_accessor :name, :date, :ordertotal, :adventureful, :lemonups, :trefoils, :dosidos, :samoas, :tagalongs, :thinmints, :smores, :toffeetastic

  def initialize name:, date:
    @name = name
    @date = date
    @ordertotal = 0
    @adventureful = 0
    @lemonups = 0
    @trefoils = 0
    @dosidos = 0
    @samoas = 0
    @tagalongs = 0
    @thinmints = 0
    @smores = 0
    @toffeetastic = 0
  end

  def to_s
    "#{@name}|#{@date.is_a?(Date) ? date.strftime("%F") : date}|#{@adventureful}|#{@lemonups}|#{@trefoils}|#{@dosidos}|#{@samoas}|#{@tagalongs}|#{@thinmints}|#{@smores}|#{@toffeetastic}|#{@ordertotal}"
  end
end

entry = Entry.new name: 'name', date: 'date'
entry.ordertotal = 'Order Total'
entry.adventureful = 'adventureful'
entry.lemonups = 'lemonups'
entry.trefoils = 'trefoils'
entry.dosidos = 'dosidos'
entry.samoas = 'samoas'
entry.tagalongs = 'tagalongs'
entry.thinmints = 'thinmints'
entry.smores = 'smores'
entry.toffeetastic = 'toffeetastic'

date = Date.today
File.open( "cookies4.txt", "r" ).each do |line|
  if /^\s?(\w+\s\w+)/ =~ line
    unless $1 == "Sales Total"
      puts "#{entry}"
      entry = Entry.new name: $1, date: date
    end
  end

  if /^\s+(?:Total\sPaid)\s+\d+\s*\$(\d+)\./ =~ line
    entry.ordertotal = $1
  end

  if /^(?:Sales Total: \d+\.\d+\s*)?\s*([\w\s\-']+)®\s*\d+\.\d+\s+(\d+)/ =~ line
    if $1.include? 'Adventurefuls'
      entry.adventureful = $2
    elsif $1.include? 'Lemon-Ups'
      entry.lemonups = $2
    elsif $1.include? 'Trefoils'
      entry.trefoils = $2
    elsif $1.include? 'Do-si-dos'
      entry.dosidos = $2
    elsif $1.include? 'Samoas'
      entry.samoas = $2
    elsif $1.include? 'Tagalongs'
      entry.tagalongs = $2
    elsif $1.include? 'Thin Mints'
      entry.thinmints = $2
    elsif $1.include? 'Girl Scout S\'mores'
      entry.smores = $2
    elsif $1.include? 'Toffee-tastic'
      entry.toffeetastic = $2
    end
  end

  if /(\d+\/\d+\/\d+)/ =~ line
    date = Date.strptime($1, '%m/%d/%Y')
    entry.date = date
  end
end
puts "#{entry}"