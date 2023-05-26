import numpy as np
import matplotlib.pyplot as plt
import time

# Paramètres
s = 1  # Longueur du pas
T = 1  # Intervalle de temps
n_values = [20,100,1000]  # Valeurs de n

def marche_aleatoire(n, s):
    positions = np.zeros(n+1)  # Tableau pour stocker les positions
    for i in range(1, n+1):
        deplacement = np.random.choice([-s, s])  # Déplacement aléatoire (-1 pour gauche, 1 pour droite)
        positions[i] = positions[i-1] + deplacement
    return positions

# Trajectoires
for n in n_values:
    positions = marche_aleatoire(n, s)
    time.sleep(T)
    temps = np.arange(0, n+1) * T
    plt.step(temps, positions, where='post', label=f'n = {n}')

# Paramètres de la figure
plt.xlabel('Temps')
plt.ylabel('Position')
plt.legend()
plt.grid(True)

# Affichage de la figure
plt.show()
