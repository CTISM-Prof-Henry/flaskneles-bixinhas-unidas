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
            CANTOR = query_function('''SELECT id_cantor, nome FROM CANTORES''')
            texto_lista_cantores = ''
            for CANTOR in CANTOR:
                id_cantor = CANTOR[0]
                nome_cantor = CANTOR[1]
                conta = len(nome_cantor) + 7
            texto_lista_cantores += '<li class="no-marker"><a>Servidor Informa: No momento possuimos {1} cantores cadastrados</a></li>\n'.format(id_cantor, conta)
            return flask.render_template('pagina_inicial.html', lista_cantores=texto_lista_cantores)
        except Exception:
            return flask.render_template(
                '404.html'
            )
    @app.route('/server_generated_page', methods=['GET'])
    def server_generated_page():
        return flask.render_template(
            'template_2.html',
            Preferidos ='<p class="center">Confira algumas musicas e artistas muito amados pela comunidade LGBTQIA+ </p>',
            Video_1 = '<p>I Kissed a Girl - Katy Perry</p><iframe width="560" height="315" src="https://www.youtube.com/embed/tAp9BKosZXs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_2 = '<p>Physical - Dua Lipa</p><iframe width="560" height="315" src="https://www.youtube.com/embed/9HDEHj2yzew" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_3 = '<p>Expectations - Lauren Jauregui</p><iframe width="560" height="315" src="https://www.youtube.com/embed/RHXdA-ZkEsw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_4 = '<p> All To Well - Thaylor Swift</p><iframe width="560" height="315" src="https://www.youtube.com/embed/sRxrwjOtIag" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_5 = '<p> Say my name- destiny’s child</p><iframe width="560" height="315" src="https://www.youtube.com/embed/sQgd6MccwZc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_6 = '<p> Sorry not Sorry - Demi Lovato </p><iframe width="560" height="315" src="https://www.youtube.com/embed/-MsvER1dpjM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_7 = '<p>Poker Face - Lady Gaga </p><iframe width="560" height="315" src="https://www.youtube.com/embed/bESGLojNYSo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_8 = '<p>I wanna be ur girlfrend - Girl in red</p><iframe width="560" height="315" src="https://www.youtube.com/embed/A7N_L7126Pk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_9 = '<p> Umbrella - Rihanna</p><iframe width="560" height="315" src="https://www.youtube.com/embed/CvBfHwUxHIk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
            Video_10 = '<p>Despechá - Rosalia </p><iframe width="560" height="315" src="https://www.youtube.com/embed/5g2hT4GmAGU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
        )

    @app.route('/ajax_generated_table', methods=['GET'])
    def ajax_generated_table():
        return flask.render_template('template_1.html')

    @app.errorhandler(404)
    def page_not_found(page):
        return flask.render_template('404.html'), 404

    app.register_error_handler(404, page_not_found)

    return app
