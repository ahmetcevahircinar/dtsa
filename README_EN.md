# DTSA: A Discrete Tree-Seed Algorithm for Solving Symmetric Traveling Salesman Problem

This repository contains the official MATLAB implementation of **DTSA**, a discrete variant of the Tree-Seed Algorithm (TSA) tailored for solving the **Symmetric Traveling Salesman Problem (TSP)**.

> Ahmet Cevahir Cinar, Mustafa Servet Kiran,  
> *A Discrete Tree-Seed Algorithm for Solving Symmetric Traveling Salesman Problem*,  
> Engineering Science and Technology, an International Journal, Volume 23, Issue 4, 2020, Pages 879–890.  
> DOI: https://doi.org/10.1016/j.jestch.2019.11.005

## 🌍 Problem Domain

DTSA adapts the Tree-Seed Algorithm to the discrete domain of TSP by:
- Redefining seed generation through 2-opt and swap-based transformations
- Implementing discrete crossover and mutation operators
- Using population diversity control to avoid premature convergence

Evaluated on standard TSP benchmark instances from TSPLIB.

## 📁 Contents

- `main.m`: Main script to run the algorithm
- `tspdata/`: TSP benchmark problem files (e.g. `berlin52.tsp`)

## 🛠 Requirements

- MATLAB R2016a or later
- No additional toolbox required

## 📌 Citation

```bibtex
@article{cinar2020simtreetsp,
  title = {A Discrete Tree-Seed Algorithm for Solving Symmetric Traveling Salesman Problem},
  author = {Cinar, Ahmet Cevahir and Kiran, Mustafa Servet},
  journal = {Engineering Science and Technology, an International Journal},
  volume = {23},
  number = {4},
  pages = {879--890},
  year = {2020},
  doi = {10.1016/j.jestch.2019.11.005},
  url = {https://www.sciencedirect.com/science/article/pii/S2215098619313527}
}
```

## 🤝 Contact & Collaboration

📧 Email: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
