class Filmes:


    def __init__(self, cursor):
        self._cursor = cursor


    # filmes cujo titulo contem o termo buscado
    def search(self, titulo):
        self._cursor.execute('''
            SELECT f.id, f.titulo, f.ano, f.duracao, f.classificacao, f.sinopse, f.poster,
                   GROUP_CONCAT(g.nome ORDER BY g.nome SEPARATOR ', ')
            FROM filmes f
            LEFT JOIN genero_filme gf ON gf.id_filme = f.id
            LEFT JOIN generos g ON g.id = gf.id_genero
            WHERE f.titulo LIKE %s
            GROUP BY f.id
            ORDER BY f.titulo
        ''', ('%' + titulo + '%',))
        return self._jsonify(self._cursor.fetchall())


    # filmes favoritados por um usuario
    def select_favoritos(self, usuario_id):
        self._cursor.execute('''
            SELECT f.id, f.titulo, f.ano, f.duracao, f.classificacao, f.sinopse, f.poster,
                   GROUP_CONCAT(g.nome ORDER BY g.nome SEPARATOR ', ')
            FROM favoritos fav
            JOIN filmes f ON f.id = fav.id_filme
            LEFT JOIN genero_filme gf ON gf.id_filme = f.id
            LEFT JOIN generos g ON g.id = gf.id_genero
            WHERE fav.id_usuario = %s
            GROUP BY f.id
            ORDER BY f.titulo
        ''', (usuario_id,))
        return self._jsonify(self._cursor.fetchall())


    def _jsonify(self, filmes):
        return [
            {
                'id': filme[0],
                'titulo': filme[1],
                'ano': filme[2],
                'duracao': filme[3],
                'classificacao': filme[4],
                'sinopse': filme[5],
                'poster': filme[6],
                'generos': filme[7].split(', ') if filme[7] else []
            } for filme in filmes ]