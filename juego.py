from mano import Mano
from mazo import Mazo
from carta import Carta

class Juego:

    def __init__ (self):
        pass

    def menu (self):
        print("Bienvenido")
        print("Para iniciar el juego dígite 1")
        print("Para salir digite 0")
        num = int(input())

        if(num == 1):
            self.inicio_juego()
        elif(num==0):
            exit()
        else:
            self.menu()

    def inicio_juego(self):
        print("El repartidor toma un mazo y baraja las cartas.")
        mazo = Mazo()
        mazo.barajar
        print("-----------------------------------------")

        print("El repartidor toma una mano y se la da...")
        self.carta1 = Carta(9, "picas")
        self.carta2 = Carta(8, "trebol")
        #print(str(mazo.dar_carta(0)) + "," + str(mazo.dar_carta(1)))
        mano = Mano(mazo.dar_carta(0))
        
        
        

j = Juego()
j.menu()
