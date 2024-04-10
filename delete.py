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


# Deletar  Jogador
sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""
data = (4,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (5,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (6,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (7,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (8,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (9,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

sql = """
    DELETE FROM Jogador WHERE idJogador = %s 
"""

data = (10,)

cursor.execute(sql, data)
connection.commit()
print ( "registros alterados" )

# -----------------------------------------------------------------------------------------------

cursor.close()
connection.close()

