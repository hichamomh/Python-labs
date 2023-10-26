import numpy as np 
import matplotlib.pyplot as plt


def markov(rho, A, nmax, rng):
    """"
     Function that implements markov chain
     Parameters:
        - `rho`: law of the initial state (nonnegative vector of size N, summing to 1),
        - `A`: transition matrix (of size N x N) 
        - `nmax`: number of time steps,
        - `rng`: random number generator
        
    Returns : 
        - `X`: trajectory of the chain.
    """
    
    # Vérifications des paramètres d'entrée
    N = len(rho)
    assert len(A) == N and A.shape[0] == A.shape[1], "La matrice de transition A doit être carrée."
    assert np.all(np.isclose(np.sum(A, axis=1), 1)), "La matrice de transition A doit être stochastique."
    assert np.all(np.isclose(rho.sum(), 1)), "Le vecteur rho doit appartenir au simplexe unité."
    assert nmax > 0, "Le nombre d'itérations nmax doit être strictement positif."
    np.random.seed(rng)
    states = np.arange(N)
    X = np.empty(nmax, dtype=int)
    
    # Générer l'état initial X_0 selon la loi rho
    X[0] = np.random.choice(states, p=rho)
    
    for q in range(1, nmax):
        # Calculer la distribution de probabilité pour X_{q+1} (a_{X_q} est la ligne correspondant à X_q)
        transition_probs = A[X[q - 1]]
        # Générer X_{q+1} selon la distribution de probabilité
        X[q] = np.random.choice(states, p=transition_probs)
    """plt.figure(figsize=(20,20))
    plt.plot([i for i in range(len(X))],X)
    plt.xlabel("step")
    plt.ylabel("trajectory")"""

    
    return X


def generate_markov_parameters(N):
    # Générer une matrice de transition aléatoire (stochastique)
    A = np.random.rand(N, N)
    A /= A.sum(axis=1, keepdims=True)

    # Générer un vecteur rho aléatoire dans le simplexe unité
    rho = np.random.dirichlet(np.ones(N))

    return A, rho


