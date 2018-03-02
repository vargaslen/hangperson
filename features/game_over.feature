Feature: game over

  En mi rol de jugador de Hangperson
  Y para poder regresar a mi traebajo!
  Quisiera saber cuando este juego termine

Scenario: el juego termina cuando lo gano:

  Given Comienzo un juego nuevo con la palabra "foobar"
  When Pruebo con las letras: f,o,b,a,r
  Then Deberia ver "You Win!"

Scenario: game over because I run out of guesses

  Given Comienzo un juego nuevo con la palabra "zebra"
  When Pruebo con las letras: t,u,v,w,x,y
  And I guess "d"
  Then Deberia ver "Sorry, you lose!"
