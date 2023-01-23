"""
Arquivo com definições de roteamento para a aplicação.

É uma boa prática de programação colocar o mesmo nome do roteamento, da função e do arquivo HTML.
"""
import os
import sqlite3

import flask

try:
    # esse bloco de código roda se o código for executado pelo Pycharm
    folder = ''
    from app.models import query_function
except ModuleNotFoundError:
    # esse bloco de código roda se o código for executado pela linha de comando
    from models import query_function


def main(app: flask.app.Flask) -> flask.app.Flask:

    @app.route('/')
    def initial_page():
        try:
            CANTOR = query_function('''SELECT Id_cantor, nome FROM CANTORES''')
            texto_lista_cantores = ''
            for CANTOR in CANTOR:
                id_cantor = CANTOR[0]
                nome_cantor = CANTOR[1]
                rota = 'cantores/{0}'.format(id_cantor)
                texto_lista_cantores += '<li class="no-marker"><a href="{0}">{1}</a></li>\n'.format(rota, nome_cantor)

            return flask.render_template('pagina_inicial.html', lista_materias=texto_lista_cantores)
        except Exception:
            return flask.render_template(
                '404.html'
            )

    @app.route('/cantores/<id_cantor>', methods=['GET'])
    def cantores(id_cantores):
        try:
            Cantores = query_function('''SELECT nome FROM CANTORES WHERE id_cantor = {0}'''.format(id_cantores))[0][0]

            texto_paragrafos = '<p class="center">Esta é a página de musica <b>{0}!</b></p><br/>\n'.format(Cantores)
            texto_paragrafos += '<p class="center">Veja os cantores cadastrados em nosso banco:</p><br/>\n'

            cantores = query_function('''
                SELECT p.nome
                FROM CANTORES p
                INNER JOIN CANTOR_ALBUM ppm on p.id_cantor = ppm.id_album
                INNER JOIN CANTORES m on ppm.id_cantor = m.cantor
                WHERE m.id_cantor = '{0}';
            '''.format(id_cantores))

            texto_paragrafos += '<ul class="center">\n'
            for cant in cantores:
                texto_paragrafos += '\t<li>{0}</li>\n'.format(cant[0])
            texto_paragrafos += '</ul>'

            results = query_function('''SELECT nome, link FROM CANTOR WHERE id = {0};'''.format(id_cantores))
            return flask.render_template(
                'template_1.html',
                nome='<p>{0}</p>'.format(results[0][0]),
                link='<p>{0}</p>'.format(results[0][1])
            )
        except Exception:
            return flask.render_template(
                    '404.html'
                )

    @app.route('/server_generated_page', methods=['GET'])
    def server_generated_page():
        return flask.render_template(
            'template_2.html',
            paragrafo='<p class="center">Este parágrafo foi renderizado pelo servidor!</p>',
            imagem='<img class="center" src="' + flask.url_for('static', filename='IMG/catalyzer_UwU.gif') + '">'
        )

    @app.route('/ajax_generated_table', methods=['GET'])
    def ajax_generated_table():
        return flask.render_template('template_1.html')

    @app.errorhandler(404)
    def page_not_found(page):
        return flask.render_template('404.html'), 404

    app.register_error_handler(404, page_not_found)

    return app
