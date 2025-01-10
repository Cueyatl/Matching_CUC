from flask import Flask, request, jsonify
from base import mostrar_usuarios, crear_usuario, buscar_usuario, actualizar_usuario, eliminar_usuario

app = Flask(__name__)
@app.route('/create_user', methods=['POST'])


def create_user():
    data = request.json
    if not data:
        return jsonify({"error": "No data provided"}), 400
    try:
        
        # Extract data from the request
        id_usuario = data.get('id')
        email = data.get('email')
        contrasena = data.get('contrasena')
        nombre = data.get('nombre')
        edad = data.get('edad')
        genero = data.get('genero')
        altura = data.get('altura')
        color_piel = data.get('color_piel')
        carrera = data.get('carrera')
        complexion = data.get('complexion')
        tipo_de_persona = data.get('tipo_de_persona')
        genero_interes = data.get('genero_interes')
        altura_interes = data.get('altura_interes')
        color_piel_interes = data.get('color_piel_interes')
        personalidad_interes = data.get('personalidad_interes')
        carrera_interes = data.get('carrera_interes')
        complexion_interes = data.get('complexion_interes')
        etiquetas = data.get('etiquetas')
        foto = data.get('foto')

        result = crear_usuario(
            id_usuario, email, contrasena, nombre, edad, genero, altura, color_piel,
            carrera, complexion, tipo_de_persona, data['genero_interes'], data['altura_interes'], data['color_piel_interes'],
            data['personalidad_interes'], data['carrera_interes'], data['complexion_interes'], 
            data['etiquetas'], foto
        )
        
        
        print(f"Creating user: {id_usuario}, {email}, {nombre}, {genero}, {edad}, {altura}, {color_piel}, {carrera}, {complexion}, {tipo_de_persona}, {genero_interes}, {altura_interes}, {color_piel_interes}, {personalidad_interes}, {carrera_interes}, {complexion_interes}, {etiquetas}, {foto}")
        print("Request JSON:", request.json)
        
        # If successful, return a success message
        if result["success"]:
            return jsonify({"message": result["message"], "data": data}), 200
        else:
            # If not, return an error message
            return jsonify({"error": result["message"]}), 400

    except Exception as e:
        print("Request JSON:", request.json)
        return jsonify({"error": str(e)}), 500

    
@app.route('/show_users', methods=['GET'])
def show_users():
    usuarios = mostrar_usuarios()
    return jsonify(usuarios)
@app.route('/get_user/<int:user_id>', methods=['GET'])
def get_user(user_id):
    # Assuming buscar_usuario is modified to return data
    user = buscar_usuario(user_id)
    return jsonify(user)

@app.route('/update_user', methods=['PUT'])
def update_user():
    data = request.json
    # Assuming actualizar_usuario is adapted to take arguments
    actualizar_usuario(data['id'], data['nombre'], data['genero'], data['edad'], data['altura'], data['color_piel'], data['tipo_de_cuerpo'], data['tipo_de_persona'])
    return jsonify({"message": "User updated successfully"})

@app.route('/delete_user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    eliminar_usuario(user_id)
    return jsonify({"message": "User deleted successfully"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)