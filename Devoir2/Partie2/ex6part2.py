import numpy as np
import matplotlib.pyplot as plt

def marche_aleatoire(n, T):
    positions = np.zeros(n+1)  # Tableau pour stocker les positions
    for i in range(1, n+1):
        deplacement = np.random.choice([-1, 1])  # Déplacement aléatoire (-1 pour gauche, 1 pour droite)
        positions[i] = positions[i-1] + deplacement
    return positions

# Paramètres
s = 1  # Longueur du pas
n = 100  # Nombre d'intervalles de temps fixé
T_values = [1, 0.1, 0.01, 0.001]  # Valeurs de T de plus en plus petites

# Trajectoires
for T in T_values:
    positions = marche_aleatoire(n, T)
    temps = np.arange(0, n+1) * T
    plt.step(temps, positions, where='post', label=f'T = {T}')

# Paramètres de la figure
plt.xlabel('Temps')
plt.ylabel('Position')
plt.legend()
plt.grid(True)

# Affichage de la figure
plt.show()
