Feature: plantar el jugador
    
    Como jugador quiero plantarme para finalizar el turno.

Scenario: plantar
Given la mano del jugador
When el jugador no quiere mas cartas
Then no recibe mas cartas y se l da el turno al repartidor 
And no se le reparten más cartas

