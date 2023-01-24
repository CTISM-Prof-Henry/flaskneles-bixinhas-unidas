import os
import os
import sqlite3
import sys
from datetime import datetime as dt

import flask
from flask import request, jsonify

filepath = os.path.dirname(__file__)
sys.path.append(os.path.join(filepath, '../app/static'))
def data_para_string(data: dt) -> str:
    """
    Converte uma data para uma string, no formato ANO-MÊS-DIA.
    """
    string = data.strftime('%Y-%m-%d')
    return string


def string_para_data(string: str) -> dt:
    """
    Converte uma string no formato ANO-MÊS-DIA para uma data.
    """
    data = dt.strptime(string, '%Y-%m-%d')
    return data


def query_function(query: str = None, database_path: str = None) -> list:

    if database_path is None:
        database_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'static', 'database', 'test.db')

    if query is None:
        raise ValueError('query não pode ser None!')

    # se conecta ao arquivo do banco
    with sqlite3.connect(database_path) as con:
        # pega um cursor para executar as operações
        # um cursor é uma conexão para o banco de dados (e.g. cria, deleta, insere, etc)
        cur = con.cursor()

        answer = cur.execute(query).fetchall()
        return answer


def main(app: flask.app.Flask) -> flask.app.Flask:
    @app.route('/generate_table', methods=['POST'])

    def generate_table():
            nome_tabela = request.form['opcao_selecionada']
            tabela = query_function('''SELECT * FROM {0}'''.format(nome_tabela))
            tabela = tuple([x[0] for x in tabela])
            resposta = query_function('''SELECT * FROM {0}'''.format(nome_tabela))
            nova_resposta = []
            for linha in resposta:
                nova_resposta.append({k: v for k, v in zip(tabela, linha)})
            response = jsonify(nova_resposta)
            response.headers.add('Access-Control-Allow-Origin', '*')
            return response

    return app
