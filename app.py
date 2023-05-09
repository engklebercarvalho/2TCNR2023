import json
from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)

# Configurar a extensão Flask-CORS
cors = CORS(app, resources={r"/cadastro": {"origins": "*"}})

# Rota para cadastro de alunos
@app.route('/cadastro', methods=['POST'])
def cadastro():
    # Obter os dados do formulário a partir do corpo da solicitação
    dados = request.get_json()

    # Imprimir os dados do aluno no console para depuração
    print(dados)

    # Retornar uma mensagem de sucesso
    return jsonify({'mensagem': 'Dados do aluno recebidos com sucesso!'})

# Rota inicial
@app.route('/')
def index():
    return 'Bem-vindo ao cadastro de alunos!'

if __name__ == '__main__':
    app.run(host="0.0.0.0",port=80)

