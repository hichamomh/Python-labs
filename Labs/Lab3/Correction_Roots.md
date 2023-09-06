# Finding $W^*$ :

Correction (**here $W_{n-1}$ takes the place of $\vec{A}$ and $\vec{B}$ the place of $W_{n}$**):

Let $n \in \mathbb{N}^{\star}$ such that $W_n$ is out of $\mathcal{B}(\mathbf{0}, 1)$.  The intersection $W^*$ of the line segment $[W_{n-1}, W_{n}]$ with $\mathcal{B}(\mathbf{0}, 1)$ thus verifies

$$
    \begin{cases}
        W^{\star} &= \alpha W_{n-1} + (1-\alpha) W_{n},~ \alpha \in [0, 1] \\
        \Vert W^{\star} \Vert_2 &= 1,
    \end{cases}
$$

> Recall:
> - The Euclidean norm ($l^2$-norm) of $W^{\star}$ is computed as $\sqrt{\langle W^{\star}, W^{\star} \rangle}$ which is equal to $({W^{\star}}^{T}  W^{\star})^{\frac{1}{2}}$ where ${W^{\star}}^{T}  W^*= \Vert W^{\star} \Vert^2$. Finally, **${W^{\star}}^{T}  W^{\star} = 1$**. 
> - $(\mathbf{v}+ \mathbf{w})^T(\mathbf{v}+ \mathbf{w})=(\mathbf{v}^T+ \mathbf{w}^T)(\mathbf{v}+ \mathbf{w})$ which is equal to $\mathbf{v}^T\mathbf{v}+\mathbf{v}^T\mathbf{w}+\mathbf{w}^T\mathbf{v} + \mathbf{w}^T \mathbf{w}$. From the fact that $\mathbf{v}^T\mathbf{w}=\mathbf{w}^T\mathbf{v}$ we get the final expression $$(\mathbf{v}+ \mathbf{w})^T(\mathbf{v}+ \mathbf{w})=\mathbf{v}^T\mathbf{v}+2\mathbf{v}^T\mathbf{w}+\mathbf{w}^T \mathbf{w}$$

Let us consider that $\mathbf{v}= \alpha (W_{n-1}- W_{n})$ and $\mathbf{w}= W_{n}$. Then, 

$$\alpha^{2} (W_{n-1}- W_{n})^{T} (W_{n-1}- W_{n})+ 2\alpha (W_{n-1}- W_{n})^{T} W_{n} + W_{n}^{T} W_{n} = 1$$

resulting in the following 2nd order polynomial equation in $\alpha$:

$$
    p(\alpha) = \alpha^2 \Vert W_{n-1} - W_n \Vert^2  + 2\alpha \langle W_{n-1} - W_n, W_n \rangle + \Vert W_{n}\Vert^2 - 1 = 0,~ \text{for } \alpha \in [0,1].
$$

> Hint: 
> - $p(\alpha) = c_2\alpha^2+ c_1 \alpha + c_0$
> - $\Delta = c_1^2-4c_2c_0 $
> - $c_2= \Vert W_{n-1} - W_n \Vert^2$, $c_1=2\langle W_{n-1} - W_n, W_n \rangle$, $c_0=\Vert W_{n}\Vert^2-1$
> - $\alpha^* = \frac{-c_1 \pm \sqrt{\Delta}}{2c_2}$

Thus,

$$
    \Delta = 4 \big[ \langle W_{n-1} - W_n, W_n \rangle^2 + \Vert W_n- W_{n-1} \Vert^2 \underbrace{(1-\Vert W_{n}\Vert^2)}_{>0} \big], $$

 Then   
    
  $$\alpha^* = \frac{- 2 \langle W_{n-1} - W_n, W_n \rangle \pm \sqrt{\Delta}}{2 \Vert W_{n-1} - W_n \Vert^2}$$

  which results in $\alpha^* = \frac{- \langle W_{n-1} - W_n, W_n \rangle \pm \sqrt{\langle W_{n-1} - W_n, W_n \rangle^2 + \Vert W_{n-1} - W_n\Vert^2 (1-\Vert W_{n}\Vert^2)}}{\Vert W_n- W_{n-1} \Vert^2}$

and $W^* = \alpha^* W_{n-1} + (1-\alpha^*) W_{n}$.
