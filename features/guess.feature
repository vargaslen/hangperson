Feature: Adivino correctamente

  En mi rol de jugador de Hangperson
  So that I can make progress toward the goal
  I want to see when my guess is correct

Scenario: guess correct letter that occurs once

  Given Comienzo un juego nuevo con la palabra "garply"
  When I guess "r"
  Then I should see "r" within "span.word"

Scenario: guess correct letter that occurs multiple times

  Given Comienzo un juego nuevo con la palabra "animal"
  When I guess "a"
  Then I should see "a---a-" within "span.word"

Scenario: guess incorrect letter

  Given Comienzo un juego nuevo con la palabra "xylophone"
  When I guess "a"
  Then I should see "a" within "span.guesses"

Scenario: multiple correct and incorrect guesses

  Given Comienzo un juego nuevo con la palabra "foobar"
  When Pruebo con las letras: a,z,x,o
  Then the word should read "-oo-a-"
  And the wrong guesses should include: z,x
