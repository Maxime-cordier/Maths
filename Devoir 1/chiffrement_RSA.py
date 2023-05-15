'''
Devoir 1
Chiffrement RSA

Auteurs:
    - Maxime Cordier
'''

"""
    exp_rapide : Calcule l'exponentiation rapide d'un entier.
    @param a : Un entier.
    @param n : Un entier.
    @return : Un entier. Résultat de a à la puissance n.
"""
def exp_rapide(a, n):
    # Cas de base
    if n == 0:
        return 1
    # Cas récursif
    elif n % 2 == 0:
        return exp_rapide((a * a), n / 2)
    else:
        return (exp_rapide((a * a), (n - 1) / 2) * a)

"""
    bezout : Calcule les coefficients de Bezout de deux entiers.
    @param a : Un entier.
    @param b : Un entier.
    @return : Un tuple contenant (u, v, d) où u et v sont les coefficients de Bezout
    et d est le pgcd de a et b.
"""
def bezout(a, b):
    # Cas de base
    if b == 0:
        return (1, 0, a)
    # Cas récursif
    else:
        u, v, d = bezout(b, a % b)
        return (v, u - (a // b) * v, d)

"""
    chiffrement_RSA : Chiffre un message avec la méthode RSA.
    @param message : Entier à chiffrer.
    @param cle_publique : Tuple contenant les paramètres e et n de la clé publique.
    @return : Un entier. Le message chiffré.
"""
def chiffrement_RSA(message, cle_publique):
    return exp_rapide(message, cle_publique[0]) % cle_publique[1]

"""
    dechiffrement_RSA : Déchiffre un message avec la méthode RSA.
    @param message : Entier à déchiffrer.
    @param cle_publique : Tuple contenant les paramètres e et n de la clé publique.
    @param p : Nombre premier.
    @param q : Nombre premier.
    @return : Un entier. Le message déchiffré.
"""
def dechiffrement_RSA(message, cle_publique, p, q):
    
    # Calcul de la clé privée
    PHIn = (p - 1) * (q - 1)
    coef_bezout = bezout(cle_publique[0], PHIn)
    clé_privé = coef_bezout[0] % PHIn

    return exp_rapide(message, clé_privé) % cle_publique[1]


# Main
if __name__ == '__main__':

    exp_rapide_res = exp_rapide(26, 45)
    bezout_res = bezout(2, 5)

    p = 11
    q = 19
    clé_publique = (7, 209)
    message = 5
    
    chiffrement_RSA_res = chiffrement_RSA(message, clé_publique)
    dechiffrement_RSA_res = dechiffrement_RSA(chiffrement_RSA_res, clé_publique, p, q)

    print("Exponentiation rapide : " +str(exp_rapide_res))
    print("Coeficients de Bezout (u, v, PGCD): " +str(bezout_res))
    print("Chiffrement RSA : " +str(chiffrement_RSA_res))
    print("Déchiffrement RSA : " +str(dechiffrement_RSA_res))

    print('end')