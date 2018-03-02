Feature: game over

  En mi rol de jugador de Hangperson
  Y para poder regresar a mi traebajo!
  Quisiera saber cuando este juego termine

Scenario: el juego termina cuando lo gano:

  Given Comienzo un juego nuevo con la palabra "foobar"
  When I make the following guesses: f,o,b,a,r
  Then I should see "You Win!"

Scenario: game over because I run out of guesses

  Given Comienzo un juego nuevo con la palabra "zebra"
  When I make the following guesses: t,u,v,w,x,y
  And I guess "d"
  Then I should see "Sorry, you lose!"
