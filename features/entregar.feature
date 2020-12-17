Feature: Entregar dos cartas
    
   Como repartidor quiero entregar 2 cartas para iniciar el juego.

Scenario: entregar
Given la baraja del jugador
When el jugador quire iniciar el juego
Then se le ntregan dos cartas, una que esta visible para todas y otra qu solo el jugador pueda ver
