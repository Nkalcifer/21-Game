Feature: Solicitar carta
    
   Como jugador quiero solicitar una carta adicional para seguir jugando.

Scenario: Solicitar
Given la mano del jugador
When el jugador quire otra carta
Then se le agrega otra carta a la mano del jugador


