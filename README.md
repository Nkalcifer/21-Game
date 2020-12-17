# BEHAVE Tutorial
# Integrantes: 
| Nombre | Código   |
| ------ |---------:|
| Neider Puentes | 20181020027   |
| Christian Caro  | 20162021307    |
| Santiago Rios  | 20181020017 |

___ 

***Usaremos Python 3, y Visual Estudio Code para el siguiente Tutorial.***

![BEHAVE USES](https://camo.githubusercontent.com/9afcdb94ede677a8c791beaa5031755af94ac56969bedd3b3e9af9b48d535fa5/68747470733a2f2f7261772e6769746875622e636f6d2f6265686176652f6265686176652f6d61737465722f646f63732f5f7374617469632f6265686176655f6c6f676f312e706e67)

> Para instalar BEHAVE, asegúrese de poder ejecutar PIP para Python. Si tiene algún problema visite el siguiente enlace:

Guía Solución [PIP](https://stackoverflow.com/questions/32639074/why-am-i-getting-importerror-no-module-named-pip-right-after-installing-pip/53921438).

## Instalación Usando PIP

Para realizar la instalación de BEHAVE Usando PIP ejecute el siguiente comando que ejecutara BDD, lo cual es una técnica de desarrollo ágil:

> `pip install behave`

También puede actualizar el comportamiento a una version mas reciente mediante el siguiente comando:

>`pip install -U behave`
 
## Usando una distribución de Origen

Después de desempaquetar la distribución de origen de [Behave](https://pypi.org/project/behave/) , ingrese el directorio recién creado `behave-<version>` y ejecute:

> `python setup.py install`

# Usando El repositorio de Github

Ejecute el siguiente comando para instalar la versión más reciente desde el [repositorio Github](https://github.com/behave/behave):

 > `pip install git+https://github.com/behave/behave`

 Para instalar una versión etiquetada desde el [repositorio Github](https://github.com/behave/behave),utilice:

 >`pip install git+https://github.com/behave/behave@<tag>`

 `<tag>`es el marcador de posición de una [etiqueta existente](https://github.com/behave/behave/tags).


# 21 BlackJack & Behave

### Para este proceso, se iniciara con la generación de ciertas Historias de Usuario que permitan conocer algunas condiciones en el que el juego se puede desenvolver. Vamos a dividir las posibles historias de usuario en los participantes base del juego BlackJack, EL jugador y el Crupier o Repartidor.

### Las Historias Cumplirán la siguiente estructura

#### Como **ROL** quiero **ACCIÓN** para **FUNCIONALIDAD**  


### El rol esta definido por El jugador o el Crupier
### La Acción es la ejecutada por el actor en el Rol de la historia.
### La funcionalidad es el objetivo que cumple dicha acción.  

## Historias de Usuario BlackJack
1. Como repartidor quiero entregar 2 cartas a cada jugador para iniciar el juego.
2. Como jugador quiero determinar el valor de la mano para seguir jugando.
3. Como jugador quiero plantarme para finalizar el turno.
4. Como jugador quiero solicitar una carta adicional para seguir jugando.
5. Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.
6. Como repartidor quiero barajar las cartas para iniciar el juego.
7. Como repartidor quiero saber el valor de las manos para determinar quién gana.

### Considerando estas Historias de Usuario lo primero sera Crear una carpeta de proyecto sobre la cual trabajaremos. (En nuestro caso lo llamamos ***Tuto-21-BEHAVE***)  
### Dentro de nuestro proyecto crearemos un directorio llamado "Features", y dentro de este directorio crearemos un feature llamado carta.feature. con esto tendremos la siguiente estructura.

![estructura](/img/estructura.jpg)

### Lo siguiente a esto sera construir el feature considerando la condición que se presenta en una carta. Así tendremos lo siguiente:


    # -- FILE: Features/Steps/steps_carta.py
    from behave import *
    from carta import Carta

    @given('una {carta} para saber su valor')
    def setp(context, carta):
        valor, pinta = carta.split(",")
        context.carta = Carta(valor, pinta)

    @when('el jugador quiere saber su valor')
    def setp(context):
        context.valor = context.carta.evaluar()

    @then('el {valor:d} de la carta es correcto')
    def setp(context, valor):
        assert context.valor == valor


## ***Hay que considerar algunos elementos, o por lo menos aclarar el uso de los mismos, hablaremos de ellos de forma concreta.***

# Given

~~~
Ponemos el sistema en un estado conocido antes de que el usuario (o sistema externo) comience a interactuar con el sistema (en los siguientes pasos). Se debe evitar hablar de la interacción del usuario en estas situaciones.
~~~

# When

~~~

Tomamos acciones clave que realiza el usuario (o sistema externo). Esta es la interacción con el sistema que debería (o quizás no debería) hacer que algún estado cambie.
~~~

# Then

~~~
Observamos los resultados de la acción realizada.
~~~

### Estos elementos de Behave permiten el uso correcto, y la composición de los mismos, es la base de las pruebas realizadas. Aparte de estos elementos se tienen algunos extras que se pueden usar en la implementación de Behave, estos son "And" o "But"  como un paso - estos se renombran por comportarse para tomar el nombre de su paso anterior.

### Con estos elementos continuamos, con la implementación, en el archivo **carta.feature** se dispondrá la siguiente información:


    Feature: Carta del 21

    Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.

    Scenario Outline: determinar valor carta
    Given una <carta> para saber su valor
    When el jugador quiere saber su valor
    Then el <valor> de la carta es correcto

    Examples:
        | carta  | valor | 
        | 2, picas  | 2  |
        | A, corazones  | 1  |
        | 8, treboles  | 8  |
        | J, picas  | 10  |
        | Q, picas  | 10  |
        | K, picas  | 10  |

### *A veces se debe ejecutar un escenario con una serie de variables que dan un conjunto de estados conocidos, acciones a realizar y resultados esperados, todos con las mismas acciones básicas. se puede utilizar el esquema de escenario anterior para lograr esto*.

### Como vemos se implementan sobre el escenario que se considero de que el jugador deseaba determinara el valor de su baraja.  

    
### Seguido de esto, crearemos en el directorio "features", otra ruta, que llamaremos "steps", dentro de este, crearemos un archivo llamado ***"steps_carta.py"***.

![Pasos](/img/steps.jpg)

### Dentro de este archivo de python pondremos lo siguiente:

    from behave import *
    from carta import Carta

    @given('una {carta} para saber su valor')
    def setp(context, carta):
        valor, pinta = carta.split(",")
        context.carta = Carta(valor, pinta)

    @when('el jugador quiere saber su valor')
    def setp(context):
        context.valor = context.carta.evaluar()

    @then('el {valor:d} de la carta es correcto')
    def setp(context, valor):
        assert context.valor == valor

Esta ya es la programación que daremos nosotros a nuestro proyecto, en donde sumamo un archivo en la raiz de la carpeta, llamado Carta. con la sigueinte codificacion:

    class Carta:
    def __init__(self, valor, pinta):
        self.valor = valor
        self.pinta = pinta

    def evaluar(self):
        if self.valor in ['J', 'Q', 'K']:
            return 10
        if self.valor == 'A':
            return 1
        return int(self.valor)

    def son_iguales(self, carta):
        if self.valor == carta.valor and self.pinta == carta.pinta:
            return True
        return False


### Para realizar la prueba ejecutaremos el siguiente comando en la terminal del proyecto:

> `behave`

#### Este comando ejecutara el escenario una vez para cada línea (sin encabezado) que aparece en las tablas de datos de ejemplo. Esto nos arrojara lo siguiente:

        Feature: Carta del 21 # features/carta.feature:1
    Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.
    Scenario Outline: determinar valor carta -- @1.1   # features/carta.feature:12
        Given una 2, picas para saber su valor           # features/steps/steps_carta.py:4     
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 2 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.2   # features/carta.feature:13
        Given una A, corazones para saber su valor       # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 1 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.3   # features/carta.feature:14
        Given una 8, treboles para saber su valor        # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 8 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.4   # features/carta.feature:15
        Given una J, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.5   # features/carta.feature:16
        Given una Q, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.6   # features/carta.feature:17
        Given una K, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    1 feature passed, 0 failed, 0 skipped
    6 scenarios passed, 0 failed, 0 skipped
    18 steps passed, 0 failed, 0 skipped, 0 undefined
    Took 0m0.007s

## Podemos Observar que las condiciones se ejecutaron de forma correcta, cada escenario fue valido, al momento de conocer el valor o las condiciones requeridas, bajo la estructura que definimos en el programa. 

### Para este proyecto, se continuaría creando la misma estructura de prueba, bajo las condiciones que se requieran para cada situación de las que se hablaron en las historias de usuario. 

## Cuando ejecutamos ***`behave`*** en la terminal, debemos saber que:

### "feature" y "steps" son condiciones necesarias para la ejecución, seguidas, del proceso de codificación adecuado del programa que se desea evaluar. steps es una implementación de python step, estos archivos se ejecutan desde el directorio steps, los puede llamar como desee, siempre y cuando utilicen la extensión de archivo python. No es necesario decir que se comportan cuáles usar - va a utilizar todos ellos. **`.py`*


## El resto de Features y Steps se puede observar en las carpetas del proyecto actual, también, el resto de archivos necesarios para la ejecución correcta de behave.


