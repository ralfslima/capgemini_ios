// Importar o Express
const express = require('express')

// App (referência para trabalhar com rotas)
const app = express()

// Habilitar informações vindas via body
app.use(express.json())

// Porta de execução do projeto
const port = 3000

// Vetor para armazenar dados pessoais
let vetor = []

// Incrementador de código
let incrementadorDeCodigo = 1

// Rota para listar os dados de cada pessoa
app.get('/listar', (req, res) => {
  res.json(vetor)
})

// Rota para cadastrar pessoas
app.post('/cadastrar', (req, res) => {
    // Obter dados
    const nome   = req.body.nome
    const cidade = req.body.cidade

    // Gerar um objeto do tipo Pessoa
    const pessoa = {
        codigo: incrementadorDeCodigo++,
        nome,
        cidade
    }

    // Adicionar a pessoa no vetor
    vetor.push(pessoa)

    // Exibir os dados cadastrados
    res.json(pessoa)
})

// Rota para remover pessoas
app.delete('/remover/:codigo', (req, res) => {
    // Extrair código do parâmetro
    const codigo = parseInt(req.params.codigo)

    // Filtrar as pessoas que existem no vetor
    vetor = vetor.filter(p => p.codigo !== codigo)

    // Retorno
    res.json({"mensagem":"Pessoa removida com sucesso!"})
})

// Executar servidor para executar a API
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
