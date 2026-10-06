let div_resultado = document.querySelector("#resultado");

function criar(tag, texto) {
  let elemento = document.createElement(tag);
  if (texto !== undefined) {
    elemento.textContent = texto;
  }
  return elemento;
}

function criar_card(filme) {
  let card = criar("div");
  card.className = "card";

  if (filme.poster) {
    let poster = criar("img");
    poster.src = filme.poster;
    poster.alt = "Poster de " + filme.titulo;
    card.appendChild(poster);
  }

  card.appendChild(criar("h3", filme.titulo + " (" + filme.ano + ")"));
  card.appendChild(criar("p", "Gêneros: " + filme.generos.join(", ")));
  card.appendChild(criar("p", "Duração: " + filme.duracao + " min | Classificação: " + filme.classificacao));
  card.appendChild(criar("p", filme.sinopse));
  return card;
}

function mostrar_filmes(filmes, mensagem_vazia) {
  if (filmes.length === 0) {
    div_resultado.appendChild(criar("p", mensagem_vazia));
    return;
  }
  filmes.forEach(function (filme) {
    div_resultado.appendChild(criar_card(filme));
  });
}

function mostrar_resposta(dados) {
  div_resultado.innerHTML = "";

  if (dados.erro) {
    div_resultado.appendChild(criar("p", dados.erro));
  } else if (dados.filmes) {
    mostrar_filmes(dados.filmes, "Nenhum filme encontrado.");
  } else if (dados.usuarios) {
    if (dados.usuarios.length === 0) {
      div_resultado.appendChild(criar("p", "Nenhum usuário encontrado."));
    }
    dados.usuarios.forEach(function (usuario) {
      div_resultado.appendChild(criar("h2", "Favoritos de " + usuario.nome));
      mostrar_filmes(usuario.favoritos, "Este usuário não tem favoritos.");
    });
  }
}

document.querySelectorAll("form").forEach(function (form) {
  form.addEventListener("submit", async function (evento) {
    evento.preventDefault();

    let parametros = new URLSearchParams();
    for (let [nome, valor] of new FormData(form)) {
      if (valor.trim() !== "") {
        parametros.append(nome, valor.trim());
      }
    }

    let resposta = await fetch(form.dataset.url + "?" + parametros.toString()),
        dados = await resposta.json();
    mostrar_resposta(dados);
  });
});