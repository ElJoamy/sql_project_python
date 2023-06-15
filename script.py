import random
import string
from datetime import datetime

import mysql.connector

# Conexión a la base de datos
cnx = mysql.connector.connect(
    host='192.168.207.111',
    user='root',
    password='root',
    database='DbOficial'
)
cursor = cnx.cursor()

# Generar nombres aleatorios
def generar_nombres():
    nombres = ["Dylan","Joel","Marcos","Joseph","Juan", "María", "Carlos", "Laura", "Pedro", "Ana", "Luis", "Mónica", "Ricardo", "Carmen", "Javier", "Sofía", "Diego", "Valentina", "Alejandro", "Isabella", "Andrés", "Camila", "Gabriel", "Lucía", "Fernando", "Daniela", "Emilio", "Carolina", "José", "Mariana", "Ignacio", "Renata", "Hugo", "Victoria", "Francisco", "Clara", "Sebastián", "Adriana", "Roberto", "Gabriela", "Manuel", "Paula", "Gustavo", "Natalia", "Óscar", "Olivia", "Fabián", "Antonia", "Arturo", "Patricia", "Rafael", "Julia", "Emmanuel", "Constanza", "Rogelio", "Verónica", "Leonardo", "Valeria", "Raúl", "Diana", "Bruno", "Elena", "Esteban", "Alicia", "René", "Montserrat", "Simón", "Ángela", "Maximiliano", "Ximena", "Eduardo", "Pamela", "Alan", "Michelle", "César", "Luciana", "Ulises", "Florencia", "Nicolás", "Marina", "Miguel", "René", "Ernesto", "Abril", "Felipe", "Brenda", "Raul", "Beatriz", "Damián", "Ivanna", "Jorge", "Dulce", "Federico", "Rosa", "Armando", "Margarita", "Germán", "Marisol", "Iván", "Alejandra", "Rodolfo", "Elizabeth", "Eduardo", "Daniela", "Mario", "Gabriela"]
    return random.choice(nombres)

# Generar apellidos aleatorios
def generar_apellido():
    apellidos = ["Gómez", "Martínez", "López", "Hernández", "Fernández", "González", "Rodríguez", "Pérez", "García", "Torres", "Silva", "Vargas", "Ramírez", "Reyes", "Mendoza", "Castillo", "Ortega", "Vargas", "Navarro", "Salazar", "Cruz", "Morales", "Guerrero", "Rojas", "Vega", "León", "Herrera", "Soto", "Medina", "Delgado", "Cortés", "Pacheco", "Orozco", "Bautista", "Fuentes", "Villanueva", "Aguilar", "Campos", "Ríos", "Cabrera", "Montes", "Molina", "Miranda", "Quintero", "Romero", "Ibarra", "Escobar", "Paredes", "Estrada", "Cardenas", "Chavez", "Ramos", "Arias", "Contreras", "Duarte", "Guzmán", "Pineda", "Gallardo", "Lara", "Sandoval", "Valenzuela", "Castañeda", "Calderón", "Lugo", "Sánchez", "Flores", "Salinas", "Benítez", "Uribe", "Rosales", "Avila", "Espinoza", "Barrera", "Mora", "Zamora", "Luna", "Barrera", "Mejía", "Miramontes", "Beltrán", "Navarrete", "Gallegos", "Cervantes", "Valle", "Cárdenas", "Espinosa", "Terrazas", "Segura", "Mendez", "Meléndez", "Cano", "Rivero", "Casillas", "Acevedo", "Figueroa", "Hurtado", "Herrera"]
    return random.choice(apellidos)

# Generar nombres de departamentos aleatorios del area de medicina
def generar_nombres_deparamentos():
    nombres_departamentos = ["Medicina Interna", "Medicina Familiar", "Medicina Preventiva", "Medicina del Trabajo", "Medicina Legal", "Medicina de Urgencias", "Medicina Intensiva", "Medicina de Rehabilitación", "Medicina Física", "Medicina Deportiva", "Medicina de Emergencias", "Medicina de Desastres", "Medicina de Aviación", "Medicina de Montaña", "Medicina de Viajes", "Medicina de Altura", "Medicina de Buceo", "Medicina de la Educación Física y el Deporte", "Medicina de la Reproducción", "Medicina de la Adolescencia", "Medicina de la Mujer", "Medicina de la Vejez", "Medicina de la Conservacion"]
    return random.choice(nombres_departamentos)

# Generar nombres de categorias aleatorios del area de medicina
def generar_nombre_categorias():
    categorias = ["Cardiología", "Dermatología", "Endocrinología", "Gastroenterología", "Hematología", "Neurología", "Oftalmología", "Oncología", "Ortopedia", "Pediatría", "Psicología", "Radiología", "Urología", "Ginecología", "Odontología", "Nutrición", "Fisioterapia", "Otorrinolaringología", "Infectología", "Nefrología"]
    return random.choice(categorias)

# Generar nombres de articulos aleatorios del area de medicina
def generar_nombre_articulos():
    articulos = ["microscopio", "estetoscopio", "esfigmomanómetro", "fotóforo", "termómetro", "bisturí", "jeringa", "estuche de disección", "estuche de suturas", "lámpara de hendidura", "oftalmoscopio", "otoscopio", "refractómetro", "desfibrilador", "electrocardiograma", "especulo", "nebulizador", "tensiómetro", "linterna clínica", "fórceps", "retractor", "endoscopio", "aspirador quirúrgico", "electrocauterio", "ecógrafo", "resucitador", "nebulizador ultrasónico", "escalpelo", "tubo endotraqueal", "bombas de infusión", "monitor de signos vitales", "hemostático", "oxímetro de pulso", "catéter", "laringoscopio", "dilatador", "bolsa de drenaje urinario", "espéculo nasal", "espátula cervical", "centrifugadora", "electrodo", "tijeras quirúrgicas", "colposcopio", "herramientas de osteotomía", "martillo de reflejos"]
    return random.choice(articulos)

# Generar nombres de marcas de articulos aleatorios del area de medicina
def generar_nombre_marcas():
    marcas = ["3M", "Abbott", "Aboca", "Accu-Chek", "Acofarma", "Actafarma", "Actimel", "Activa", "Aderma", "Adidas", "Adolfo Dominguez", "Aesculap", "Alcon", "Alfa Wassermann", "Almirall", "Alvogen", "Amgen", "Angelini", "Ansell", "Apotex", "Astellas", "AstraZeneca", "Avène", "Aventis", "Bausch+Lomb", "Bayer", "Becton Dickinson", "Bial", "Biocartis", "Biogen", "Biosystems", "Boehringer Ingelheim", "Bristol Myers Squibb", "Celgene", "Cepheid", "Chiesi", "Cinfa", "Cooper", "Daiichi Sankyo", "Dermofarm", "Dermofarmacia", "Esteve", "Ferrer", "GlaxoSmithKline", "Hartmann", "Ipsen", "Isdin", "Janssen", "Johnson & Johnson", "Kern Pharma", "La Roche-Posay", "Lacer", "Lainco", "Lilly", "Medtronic", "Merck", "Nestle", "Novartis", "Novo Nordisk", "Pfizer", "Roche", "Sanofi", "Schering-Plough", "Sensilis", "Servier", "Shire", "Smith & Nephew", "Takeda", "Teijin Pharma", "Teva", "Urgo", "Valeant", "Vichy"]
    return random.choice(marcas)

# Generar nombres de modelos de articulos aleatorios del area de medicina
def generar_nombre_modelos():
    modelos = ["Aeroneb", "Aeroneb Go", "Aeroneb Pro", "Alpha 100", "Alpha 200", "Beta 300", "Beta 400", "Gamma 500", "Gamma 600", "Delta 700", "Delta 800", "Epsilon 900", "Epsilon 1000", "Zeta 1100", "Zeta 1200", "Omega 1300", "Omega 1400", "Spectrum 1500", "Spectrum 1600", "Pulseox 1700", "Pulseox 1800", "Cardio 1900", "Cardio 2000", "Endo 2100", "Endo 2200", "Neuro 2300", "Neuro 2400", "Dermo 2500", "Dermo 2600", "Uro 2700", "Uro 2800", "Gastro 2900", "Gastro 3000", "Hemo 3100", "Hemo 3200", "Ortho 3300", "Ortho 3400", "Pedia 3500", "Pedia 3600"]
    return random.choice(modelos)

# Generar ubicaciones aleatorias
def generar_ubicacion():
    ciudades_bolivia = [
        'Santa Cruz de la Sierra',
        'La Paz',
        'Cochabamba',
        'Oruro',
        'Sucre',
        'Tarija',
        'Potosí',
        'Chiquisaca',
        'Beni',
        'Pando'
    ]
    return random.choice(ciudades_bolivia)


# Generar descripciones aleatorias
def generar_descripcion():
    return 'Descripción ' + ''.join(random.choice(string.digits) for _ in range(5))

# Generar fechas aleatorias
def generar_fecha():
    year = random.randint(2010, 2023)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return datetime(year, month, day).strftime('%Y-%m-%d')

# Generar datos para la tabla Departamentos
def generar_datos_departamentos():
    for i in range(50):
        nombre_departamento = generar_nombres_deparamentos()
        ubicacion = generar_ubicacion()
        query = "INSERT INTO Departamentos (nombre_departamento, ubicacion) VALUES (%s, %s)"
        values = (nombre_departamento, ubicacion)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Categorias
def generar_datos_categorias():
    for i in range(50):
        nombre_categoria = generar_nombre_categorias() # Must change generar_nombre 'cause is forn real names and thi is a categoria
        descripcion = generar_descripcion()
        query = "INSERT INTO Categorias (nombre_categoria, descripcion) VALUES (%s, %s)"
        values = (nombre_categoria, descripcion)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Articulos
def generar_datos_articulos():
    cursor.execute("SELECT id_categoria FROM Categorias")
    categorias = cursor.fetchall()
    for i in range(50):
        nombre_articulo = generar_nombre_articulos() # Must change generar_nombre 'cause is for real names and this is an articulo
        id_categoria = random.choice(categorias)[0]
        cantidad_disponible = random.randint(1, 100)
        precio_unitario = round(random.uniform(1, 1000), 2)
        query = "INSERT INTO Articulos (nombre_articulo, id_categoria, cantidad_disponible, precio_unitario) VALUES (%s, %s, %s, %s)"
        values = (nombre_articulo, id_categoria, cantidad_disponible, precio_unitario)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Usuarios
def generar_datos_usuarios():
    cursor.execute("SELECT id_departamento FROM Departamentos")
    departamentos = cursor.fetchall()
    for i in range(50):
        nombre_usuario = generar_nombres()
        departamento_id = random.choice(departamentos)[0]
        query = "INSERT INTO Usuarios (nombre_usuario, departamento_id) VALUES (%s, %s)"
        values = (nombre_usuario, departamento_id)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla TiposMovimientos
def generar_datos_tipos_movimientos():
    tipos_movimientos = [
        ("movimiento de departamento", "Movimiento que implica cambios en el departamento"),
        ("movimiento de producto", "Movimiento que implica cambios en la disponibilidad del producto"),
        ("movimiento de reubicación", "Movimiento que implica el cambio de ubicación física del producto")
    ]
    query = "INSERT INTO TiposMovimientos (nombre_tipo_movimiento, descripcion) VALUES (%s, %s)"
    cursor.executemany(query, tipos_movimientos)
    cnx.commit()

# Generar datos para la tabla Movimientos
def generar_datos_movimientos():
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()
    cursor.execute("SELECT id_usuario FROM Usuarios")
    usuarios = cursor.fetchall()
    cursor.execute("SELECT id_tipo_movimiento FROM TiposMovimientos")
    tipos_movimientos = cursor.fetchall()
    for i in range(50):
        id_articulo = random.choice(articulos)[0]
        id_usuario = random.choice(usuarios)[0]
        id_tipo_movimiento = random.choice(tipos_movimientos)[0]
        cantidad = random.randint(1, 10)
        fecha_movimiento = generar_fecha()
        query = "INSERT INTO Movimientos (id_articulo, id_usuario, id_tipo_movimiento, cantidad, fecha_movimiento) VALUES (%s, %s, %s, %s, %s)"
        values = (id_articulo, id_usuario, id_tipo_movimiento, cantidad, fecha_movimiento)
        cursor.execute(query, values)
    cnx.commit()

# Must fixs this part becuase there r no tables when the code is running

# Generar datos para la tabla Proveedores
def generar_datos_proveedores():
    for i in range(50):
        nombre_proveedor = generar_nombres()
        ubicacion = generar_ubicacion()
        telefono = ''.join(random.choice(string.digits) for _ in range(10))
        localidad = generar_ubicacion()
        query = "INSERT INTO Proveedores (nombre_proveedor, ubicacion, telefono, localidad) VALUES (%s, %s, %s, %s)"
        values = (nombre_proveedor, ubicacion, telefono, localidad)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Compras
def generar_datos_compras():
    cursor.execute("SELECT id_proveedor FROM Proveedores")
    proveedores = cursor.fetchall()
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()
    for i in range(50):
        id_proveedor = random.choice(proveedores)[0]
        id_articulo = random.choice(articulos)[0]
        cantidad = random.randint(1, 10)
        precio_unitario = round(random.uniform(1, 1000), 2)
        fecha_compra = generar_fecha()
        query = "INSERT INTO Compras (id_proveedor, id_articulo, cantidad, precio_unitario, fecha_compra) VALUES (%s, %s, %s, %s, %s)"
        values = (id_proveedor, id_articulo, cantidad, precio_unitario, fecha_compra)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Consumos
def generar_datos_consumos():
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()
    cursor.execute("SELECT id_usuario FROM Usuarios")
    usuarios = cursor.fetchall()
    for i in range(50):
        id_articulo = random.choice(articulos)[0]
        id_usuario = random.choice(usuarios)[0]
        cantidad = random.randint(1, 10)
        fecha_consumo = generar_fecha()
        query = "INSERT INTO Consumos (id_articulo, id_usuario, cantidad, fecha_consumo) VALUES (%s, %s, %s, %s)"
        values = (id_articulo, id_usuario, cantidad, fecha_consumo)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Marcas
def generar_datos_marcas():
    for i in range(50):
        nombre_marca = generar_nombre_marcas()
        descripcion = generar_descripcion()
        query = "INSERT INTO Marcas (nombre_marca, descripcion) VALUES (%s, %s)"
        values = (nombre_marca, descripcion)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Modelos
def generar_datos_modelos():
    cursor.execute("SELECT id_marca FROM Marcas")
    marcas = cursor.fetchall()
    for i in range(50):
        nombre_modelo = generar_nombre_modelos()
        id_marca = random.choice(marcas)[0]
        query = "INSERT INTO Modelos (nombre_modelo, id_marca) VALUES (%s, %s)"
        values = (nombre_modelo, id_marca)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla Clientes
def generar_datos_clientes():
    for i in range(50):
        nombre_cliente = generar_nombres()
        apellido_m = generar_apellido()
        apellido_p = generar_apellido()
        telefono = '6' + ''.join(random.choice(string.digits) for _ in range(7))
        ciudad = generar_ubicacion()
        email = generar_nombres() + "@example.com"
        query = "INSERT INTO Clientes (nombre_cliente, apellido_m, apellido_p, telefono, ciudad, email) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (nombre_cliente, apellido_m, apellido_p, telefono, ciudad, email)
        cursor.execute(query, values)
    cnx.commit()


# Generar datos para la tabla Ventas
def generar_datos_ventas():
    cursor.execute("SELECT id_cliente FROM Clientes")
    clientes = cursor.fetchall()
    for i in range(50):
        id_cliente = random.choice(clientes)[0]
        fecha_venta = generar_fecha()
        monto_total = round(random.uniform(1, 1000), 2)
        query = "INSERT INTO Ventas (id_cliente, fecha_venta, monto_total) VALUES (%s, %s, %s)"
        values = (id_cliente, fecha_venta, monto_total)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla DetalleVentas
def generar_datos_detalle_ventas():
    cursor.execute("SELECT id_venta FROM Ventas")
    ventas = cursor.fetchall()
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()
    for i in range(50):
        id_venta = random.choice(ventas)[0]
        id_articulo = random.choice(articulos)[0]
        cantidad = random.randint(1, 10)
        precio_unitario = round(random.uniform(1, 1000), 2)
        query = "INSERT INTO DetalleVentas (id_venta, id_articulo, cantidad, precio_unitario) VALUES (%s, %s, %s, %s)"
        values = (id_venta, id_articulo, cantidad, precio_unitario)
        cursor.execute(query, values)
    cnx.commit()

# Generar datos para la tabla MarcasArticulos
def generar_datos_marcas_articulos():
    cursor.execute("SELECT id_marca FROM Marcas")
    marcas = cursor.fetchall()
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()
    
    combinaciones_generadas = set()  # Conjunto para almacenar combinaciones únicas
    
    for i in range(50):
        id_marca = random.choice(marcas)[0]
        id_articulo = random.choice(articulos)[0]
        
        # Verificar si la combinación ya ha sido generada antes
        combinacion = (id_marca, id_articulo)
        if combinacion in combinaciones_generadas:
            continue  # Saltar la iteración si la combinación ya existe
        
        # Agregar la combinación generada al conjunto
        combinaciones_generadas.add(combinacion)
        
        query = "INSERT INTO MarcasArticulos (id_marca, id_articulo) VALUES (%s, %s)"
        values = (id_marca, id_articulo)
        cursor.execute(query, values)
    
    cnx.commit()


# Generar datos para la tabla ProveedoresArticulos
def generar_datos_proveedores_articulos():
    cursor.execute("SELECT id_proveedor FROM Proveedores")
    proveedores = cursor.fetchall()
    cursor.execute("SELECT id_articulo FROM Articulos")
    articulos = cursor.fetchall()

    # Crear un conjunto para realizar un seguimiento de las combinaciones ya generadas
    combinaciones_generadas = set()

    for i in range(50):
        # Generar una combinación única de id_proveedor e id_articulo
        while True:
            id_proveedor = random.choice(proveedores)[0]
            id_articulo = random.choice(articulos)[0]
            combinacion = f"{id_proveedor}-{id_articulo}"
            if combinacion not in combinaciones_generadas:
                combinaciones_generadas.add(combinacion)
                break

        query = "INSERT INTO ProveedoresArticulos (id_proveedor, id_articulo) VALUES (%s, %s)"
        values = (id_proveedor, id_articulo)
        cursor.execute(query, values)

    cnx.commit()


# Generar datos para la tabla UsuariosDepartamentos
def generar_datos_usuarios_departamentos():
    cursor.execute("SELECT id_usuario FROM Usuarios")
    usuarios = cursor.fetchall()
    cursor.execute("SELECT id_departamento FROM Departamentos")
    departamentos = cursor.fetchall()
    
    # Crear una lista para realizar un seguimiento de las combinaciones ya generadas
    combinaciones_generadas = set()
    
    for i in range(50):
        # Generar una combinación única de id_usuario e id_departamento
        while True:
            id_usuario = random.choice(usuarios)[0]
            id_departamento = random.choice(departamentos)[0]
            combinacion = f"{id_usuario}-{id_departamento}"
            if combinacion not in combinaciones_generadas:
                combinaciones_generadas.add(combinacion)
                break
        
        query = "INSERT INTO UsuariosDepartamentos (id_usuario, id_departamento) VALUES (%s, %s)"
        values = (id_usuario, id_departamento)
        cursor.execute(query, values)
    
    cnx.commit()




# Generar todos los datos
generar_datos_departamentos()
generar_datos_categorias()
generar_datos_articulos()
generar_datos_usuarios()
generar_datos_tipos_movimientos()
generar_datos_movimientos()
generar_datos_proveedores()
generar_datos_compras()
generar_datos_consumos()
generar_datos_marcas()
generar_datos_modelos()
generar_datos_clientes()
generar_datos_ventas()
generar_datos_detalle_ventas()
generar_datos_marcas_articulos()
generar_datos_proveedores_articulos()
generar_datos_usuarios_departamentos()

# Cerrar la conexión a la base de datos
cursor.close()
cnx.close()

print("Datos generados correctamente")