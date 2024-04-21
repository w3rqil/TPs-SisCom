import requests
import subprocess
import ctypes
import sys
import matplotlib.pyplot as plt
import tkinter as tk
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

C_PATH = './build/programa_en_C'
# Load the library and define the argument and return types of the C function
libgini = ctypes.CDLL(C_PATH)
libgini.convert_and_increment.argtypes = [ctypes.c_float]
libgini.convert_and_increment.restype = ctypes.c_int

def obtener_indices_gini(pais):
    url = f"https://api.worldbank.org/v2/en/country/{pais}/indicator/SI.POV.GINI?format=json&date=2011:2020&per_page=32500&page=1&country=%22{pais}%22"
    response = requests.get(url)
    data = response.json()
    indices_gini = [(entry["date"], entry["value"]) for entry in data[1] if entry["value"] is not None]
    print("indices gini_float:", indices_gini)
    return indices_gini


def obtener_resultados(indices_gini):
    resultados = []
    for year, indice_gini in indices_gini:
        resultado = libgini.convert_and_increment(indice_gini)
        resultados.append((year, resultado))
    print("indices gini_int:", resultados)
    return resultados


def configurar_figura(fig):
    ax = fig.add_subplot(111)  # Crea un subplot en la figura
    ax.set_title('Resultados del programa en C')
    ax.set_xlabel('Año')
    ax.set_ylabel('Valor')
    ax.grid(True)

def graficar_resultados(resultados, pais, fig):
    years, resultado_valores = zip(*resultados)
    ax = fig.axes[0]  # Obtiene el primer (y único) AxesSubplot de la figura
    ax.clear()  # Limpia el AxesSubplot
    ax.plot(years, resultado_valores, marker='o', linestyle='-', color='red')
    ax.set_title(f'Resultados del programa en C para {pais}')
    fig.autofmt_xdate()  # Rota las etiquetas del eje x

def mostrar_grafico():
    pais = entry.get()
    indices_gini = obtener_indices_gini(pais)
    resultados = obtener_resultados(indices_gini)
    graficar_resultados(resultados, pais, fig)
    canvas.draw()  # Actualiza el canvas

root = tk.Tk()
root.title("Gini Index Viewer")
root.geometry("800x600")
root.config(bg="blue")

label = tk.Label(root, text="Ingrese el nombre del país:")
label.config(font=("Courier", 24, "bold"),fg="yellow")  # Configura la fuente y el tamaño del texto
label.config(bg="blue") # Configura el color de fondo
label.pack(padx=20, pady=20)  # Agrega padding alrededor de la etiqueta
label.pack()

entry = tk.Entry(root)
entry.pack()

button = tk.Button(root, text="Mostrar gráfico", command=mostrar_grafico)
button.config(font=("Courier", 18, "bold"),fg="blue", bg="yellow")
button.pack(pady=20)

# Crea una figura vacía y un canvas
fig = Figure(figsize=(5, 4), dpi=100)
configurar_figura(fig)
canvas = FigureCanvasTkAgg(fig, master=root)  # A tk.DrawingArea.
canvas.get_tk_widget().pack(pady=20)

root.mainloop()
