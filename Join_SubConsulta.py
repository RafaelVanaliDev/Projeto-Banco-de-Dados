import mysql.connector

# Função para realizar uma consulta utilizando JOIN
def consultar_jogadores_com_missoes_concluidas(cursor):
    sql = """
        SELECT Jogador.nomeConta, MissoesStatus.status
        FROM Jogador
        JOIN MissoesStatus ON Jogador.idJogador = MissoesStatus.idJogador
        WHERE MissoesStatus.status = 'Completa'
    """
    cursor.execute(sql)
    results = cursor.fetchall()
    return results

# Função para realizar uma consulta utilizando subconsulta aninhada
def consultar_jogadores_com_missao_especifica(cursor, descricao_missao):
    sql = """
        SELECT nomeConta
        FROM Jogador
        WHERE idJogador IN (
            SELECT idJogador
            FROM MissoesStatus
            WHERE idMissao IN (
                SELECT idMissao
                FROM Missao
                WHERE descricao = %s
            )
        )
    """
    cursor.execute(sql, (descricao_missao,))
    results = cursor.fetchall()
    return results

# Conectar ao banco de dados
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="Jogo_OnLine2"
)
cursor = connection.cursor()

# Realizar consultas
jogadores_com_missoes_concluidas = consultar_jogadores_com_missoes_concluidas(cursor)
jogadores_com_missao_especifica = consultar_jogadores_com_missao_especifica(cursor, 'Pegue 5 baldes de agua')

# Imprimir resultados
print("Jogadores com missões concluídas:")
for jogador in jogadores_com_missoes_concluidas:
    print(jogador)

print("\nJogadores com a missão 'Pegue 5 baldes de agua':")
for jogador in jogadores_com_missao_especifica:
    print(jogador)

# Fechar cursor e conexão
cursor.close()
connection.close()
