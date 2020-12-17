from behave import *
from carta import Carta

@given('una {carta} para saber su valor')
def step(context, carta):
    valor, pinta = carta.split(",")
    context.carta = Carta(valor, pinta)

@when('el jugador quiere saber su valor')
def step(context):
    context.valor = context.carta.evaluar()

@then('el {valor:d} de la carta es correcto')
def step(context, valor):
    assert context.valor == valor