from flask import Blueprint, request

from database import inicia_conexao
from models.filmes import Filmes


filmes_bp = Blueprint('filmes', __name__)


# Rota de pesquisa de filmes -- inicia uma única rota lógica para filmes fora do arquivo pincipal app.py
@filmes_bp.route('/')
def busca_filmes():
    titulo = request.args.get('titulo', '').strip()
    if titulo == '':
        return { 'erro': 'Informe o parâmetro titulo' }, 400

    model = Filmes(inicia_conexao().cursor())
    return { 'filmes': model.pesquisar(titulo) }