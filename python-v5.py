import requests
import subprocess
import sys
import matplotlib.pyplot as plt

def obtener_indices_gini(pais):
    url = f"https://api.worldbank.org/v2/en/country/{pais}/indicator/SI.POV.GINI?format=json&date=2011:2020&per_page=32500&page=1&country=%22{pais}%22"
    response = requests.get(url)
    data = response.json()
    indices_gini = [(entry["date"], entry["value"]) for entry in data[1] if entry["value"] is not None]
    return indices_gini

def obtener_resultados(indices_gini):
    resultados = []
    for year, indice_gini in indices_gini:
        resultado = subprocess.run(['./programa_en_C', str(indice_gini)], capture_output=True, text=True)
        resultado_valor = float(resultado.stdout.strip())
        resultados.append((year, resultado_valor))
    return resultados

def graficar_resultados(resultados, pais):
    years, resultado_valores = zip(*resultados)
    plt.figure(figsize=(10, 6))
    plt.plot(years, resultado_valores, marker='o', linestyle='-', color='red')
    plt.title(f'Resultados del programa en C para {pais}')
    plt.xlabel('Año')
    plt.ylabel('Valor')
    plt.grid(True)
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python main.py <país>")
        sys.exit(1)

    pais = sys.argv[1]
    indices_gini = obtener_indices_gini(pais)
    resultados = obtener_resultados(indices_gini)

    print(f"Índices GINI de {pais}:")
    for indice_gini in indices_gini:
        print(indice_gini)

    print(f"Resultados del programa en C para {pais}:")
    for resultado in resultados:
        print(resultado)

    graficar_resultados(resultados, pais)
