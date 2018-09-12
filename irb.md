In order to use public transport
As a customer
I want money on my card

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new
  oyster.balance == 0


In order to keep using public transport
As a customer
I want to add money to my card

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new
  oyster.top_up(2)
  oyster.balance == 2

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new(90)
  oyster.top_up(1)
  --> raise exception

In order to pay for my journey
As a customer
I need my fare deducted from my card

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.deduct(5)
  oyster.balance == 5

In order to get through the barriers.
As a customer
I need to touch in and out.

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.in_journey? == false
  oyster.touch_in
  oyster.in_journey? == true
  oyster.touch_out
  oyster.in_journey? == false

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new
  oyster.touch_in
  --> raises error

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.touch_in
  oyster.touch_out
  oyster.balance
  --> 9

In order to pay for my journey
As a customer
I need to know where I've travelled from

in irb
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.touch_in('entry_station')
  oyster.entry_station == 'entry_station'
  => true

In order to know where I have been
As a customer
I want to see all my previous trips

in pry
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.touch_in('barons court')
  oyster.touch_out('south ealing')
  oyster.journeys
  => [{ start: 'barons court', end: 'south ealing' }]

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

in pry
  load './lib/station.rb'
  barons_court = Station.new("Barons Court", 2)
  barons_court.zone == 2

Let's create a new Journey class, it should be responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.

in pry
  load './lib/oystercard.rb'
  oyster = Oystercard.new(10)
  oyster.touch_in("West Kensington")
  oyster.touch_out("South Kensington")
  oyster.journeys
  --> [{Entry: W K, Exit: S K}]
