class Usuarios:


    def __init__(self, cursor):
        self._cursor = cursor


    # usuarios cujo nome contem o termo buscado
    def search(self, nome):
        self._cursor.execute(
            'SELECT id, nome FROM usuarios WHERE nome LIKE %s ORDER BY nome',
            ('%' + nome + '%',))
        return [ { 'id': usuario[0], 'nome': usuario[1] }
                 for usuario in self._cursor.fetchall() ]
