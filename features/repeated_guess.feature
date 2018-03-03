Feature: guess repeated letter

  En mi rol de jugador de Hangperson
  So that I can avoid wasting guesses on letters I've already tried
  I want to be informed when I guess a letter I've already tried

Scenario: guess correct letter that I have already tried

  Given Comienzo un juego nuevo con la palabra "bumblebee"
  When Pruebo con "b"
  And Pruebo con "b" de nuevo
  Then the word should read "b--b--b--"
  And Deberia ver "Ya probaste con esa letra"

Scenario: guess incorrect letter that I have already tried

  Given Comienzo un juego nuevo con la palabra "giraffe"
  When Pruebo con "z"
  And Pruebo con "z" de nuevo
  Then the word should read "-------"
  And Deberia ver "Ya probaste con esa letra"

Scenario: guessing an incorrect letter does not count towards guesses

  Given Comienzo un juego nuevo con la palabra "snake"
  When Pruebo con "z" 30 veces seguidas
  Then I should be on the show page
