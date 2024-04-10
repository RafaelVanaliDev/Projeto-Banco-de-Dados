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


# Atualizar em Jogador
sql = """
    UPDATE Jogador SET nomeConta = %s, email = %s, senha = %s, mora = %s WHERE idJogador = %s 
"""
data = (
    'Python', 'python@example.com', 'python789', 100, 3
)

cursor.execute(sql, data)
connection.commit()

recordsaffected = cursor.rowcount
print(recordsaffected, " registros alterados")


# -----------------------------------------------------------------------------------------------


# Atualizar as recompensas das missões 1 e 7
sql = """
    UPDATE Missao
    SET recompensas = %s
    WHERE idMissao IN (1, 7)
"""
nova_recompensa = "100.000 moras"
data = (nova_recompensa,)

cursor.execute(sql, data)
connection.commit()

# Verificar quantos registros foram atualizados
registros_afetados = cursor.rowcount
print(registros_afetados, "registros atualizados")



cursor.close()
connection.close()

