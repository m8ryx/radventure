FactoryGirl.define do
  factory :player do
    initialize_with { new }
  end

  factory :room do
#    initialize_with { new(id, name, description, { 'north' => north,
#                                                   'south' => south,
#                                                   'east' => east,
#                                                   'west' => west,
#                                                   'up' => up,
#                                                   'down' => down,
#                                                   'northeast' => northeast,
#                                                   'northwest' => northwest,
#                                                   'southeast' => southeast,
#                                                   'southwest' => southwest }) }
    initialize_with { new(id, name, description, directions) }

    id 0
    name 'GoldRoom'
    description 'A gold room.  Neato!'
    directions "{ 'north' => false }"
#    north false
#    south false
#    east false
#    west false
#    up false
#    down false
#    northeast false
#    southeast false
#    northwest false
#    southwest false
  end

  factory :thing do
    initialize_with { new(name, description, { 'takeable' => takeable,
                                               'wearable' => wearable,
                                               'drinkable' => drinkable,
                                               'eatable' => eatable,
                                               'switchable' => switchable } ) }
    name "axe"
    description 'A hefty axe'
    takeable false
    wearable false
    drinkable false
    switchable false
    eatable false

  end
end
