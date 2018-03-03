Feature: Adivino correctamente

  En mi rol de jugador de Hangperson
  Para querer seguir jugando hasta ganar
  Quiero poder ver cuando mi adivinanza es correcta

Scenario: adivino una letra que aparece solo una vez

  Given Comienzo un juego nuevo con la palabra "garply"
  When Pruebo con "r"
  Then Deberia ver "r" en "span.word"

Scenario: adivino una letra que aparece varias veces

  Given Comienzo un juego nuevo con la palabra "animal"
  When Pruebo con "a"
  Then Deberia ver "a---a-" en "span.word"

Scenario: mi adivinanza es incorrecta

  Given Comienzo un juego nuevo con la palabra "xylophone"
  When Pruebo con "a"
  Then Deberia ver "a" en "span.guesses"

Scenario: varias adivinanzas,algunas correctas y otras no

  Given Comienzo un juego nuevo con la palabra "foobar"
  When Pruebo con las letras: a,z,x,o
  Then the word should read "-oo-a-"
  And the wrong guesses should include: z,x
