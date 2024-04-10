# -*- encoding: utf-8 -*-
import mysql.connector
import datetime


#conectar
connection = mysql.connector.connect(
    host="localhost",
    user="root",  # nome de usuário padrão do MySQL no XAMPP
    password="",  # senha vazia por padrão, a menos que você tenha alterado
    database="Jogo_OnLine2"  # digitar o nome do Banco de Dados "atual"
)
cursor = connection.cursor()


# -----------------------------------------------------------------------------------------------


print ( "Tabela Jogador -----------------------------------------------" )
sql_Jogador = "SELECT * FROM Jogador"

cursor.execute(sql_Jogador)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Login -----------------------------------------------" )
sql_Login = "SELECT * FROM Login"

cursor.execute(sql_Login)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Historico Nivel Conta -----------------------------------------------" )
sql_HistoricoNivelConta = "SELECT * FROM HistoricoNivelConta"

cursor.execute(sql_HistoricoNivelConta)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Missao -----------------------------------------------" )
sql_Missao = "SELECT * FROM Missao"

cursor.execute(sql_Missao)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Missoes Status -----------------------------------------------" )
sql_MissoesStatus = "SELECT * FROM MissoesStatus"

cursor.execute(sql_MissoesStatus)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Item -----------------------------------------------" )
sql_Item = "SELECT * FROM Item"

cursor.execute(sql_Item)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Outro -----------------------------------------------" )
sql_Outro = "SELECT * FROM Outro"

cursor.execute(sql_Outro)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Arma -----------------------------------------------" )
sql_Arma = "SELECT * FROM Arma"

cursor.execute(sql_Arma)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Personagem -----------------------------------------------" )
sql_Personagem = "SELECT * FROM Personagem"

cursor.execute(sql_Personagem)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Habilidade -----------------------------------------------" )
sql_Habilidade = "SELECT * FROM Habilidade"

cursor.execute(sql_Habilidade)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Personagem_Habilidades -----------------------------------------------" )
sql_Personagem_Habilidades = "SELECT * FROM Personagem_Habilidades"

cursor.execute(sql_Personagem_Habilidades)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela ItemList -----------------------------------------------" )
sql_Personagem_ItemList = "SELECT * FROM ItemList"

cursor.execute(sql_Personagem_ItemList)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela PersonagemAdq -----------------------------------------------" )
sql_Personagem_PersonagemAdq = "SELECT * FROM PersonagemAdq"

cursor.execute(sql_Personagem_PersonagemAdq)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------


print ( "Tabela Atributos -----------------------------------------------" )
sql_Atributos = "SELECT * FROM Atributos"

cursor.execute(sql_Atributos)
results = cursor.fetchall()

for result in results:
  print(result)

print("")
print("")

# -----------------------------------------------------------------------------------------------

