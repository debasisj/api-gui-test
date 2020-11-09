Feature: Book a hotel

  Background: Driver set up
    * configure driver = { type: 'chrome' }


    Scenario: Book a random hotel

      Given driver  BOOKING_URL

      And maximize()
      And waitFor('{a}Buy Now')

      And click('{a}Flights')
      And click('#s2id_location_from')
      * java.lang.Thread.sleep(5000)
      * print locateAll('.select2-input').length
      * def inputTo = locateAll('.select2-input').get(7)
      And input(inputTo,'SYD')
#      And click('{span}Search by Hotel or City Name')
      * java.lang.Thread.sleep(5000)

