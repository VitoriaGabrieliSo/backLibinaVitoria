from flask import Blueprint, request

from database import get_connection
from models.filmes import Filmes
from models.usuarios import Usuarios


usuarios_bp = Blueprint('usuarios', __name__)


# GET /usuarios?nome=ana
@usuarios_bp.route('/')
def busca_usuarios():
    nome = request.args.get('nome', '').strip()
    if nome == '':
        return { 'erro': 'Informe o parâmetro nome' }, 400

    cursor = get_connection().cursor()
    usuarios = Usuarios(cursor).search(nome)

    filmes = Filmes(cursor)
    for usuario in usuarios:
        usuario['favoritos'] = filmes.select_favoritos(usuario['id'])

    return { 'usuarios': usuarios }
