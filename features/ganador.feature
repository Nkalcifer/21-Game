Feature: Dterminar ganador 

    Como repartidor quiero saber el valor de las manos para determinar quién gana.

Scenario Outline: ganador
Given el <valorJugador> y el <valorManoRepartidor>
When el jugador se quiere plantó y el repartidor terminó de jugar 
Then el mayor valor de las manos que a su vez sea menor que 21 gana y se nombra el <ganador>


Examples:
    | valorJugador | valorManoRepartidor | ganador
    | 15 | 21 | repartidor
    | 20 | 19 | jugador
    | 20 | 20 | empate
    | 18 | 17 | jugador
    | 20 | 23 | jugador
    | 24 | 20 | repartidor
    | 22 | 15 | repartidor
    | 18 | 18 | empate