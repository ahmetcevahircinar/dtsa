# DTSA: Simetrik Gezgin Satıcı Probleminin Çözümü için Ayrık Ağaç-Tohum Algoritması

Bu depo, **DTSA** algoritmasının resmi MATLAB kodlarını içermektedir. DTSA, **Simetrik Gezgin Satıcı Problemini (TSP)** çözmek için ayrık yapıya uyarlanmış bir **Ağaç-Tohum Algoritmasıdır (Discrete TSA)**.

> Ahmet Cevahir Cinar, Mustafa Servet Kiran,  
> *A Discrete Tree-Seed Algorithm for Solving Symmetric Traveling Salesman Problem*,  
> Engineering Science and Technology, an International Journal, Cilt 23, Sayı 4, 2020, Sayfa 879–890.  
> DOI: https://doi.org/10.1016/j.jestch.2019.11.005

## 🌍 Problem Alanı

DTSA algoritması:
- Tohum üretimini 2-opt ve değişim temelli dönüşümlerle yeniden tanımlar
- Ayrık çaprazlama ve mutasyon operatörleri uygular
- Erken yakınsamayı önlemek için çeşitlilik kontrolü uygular

Algoritma, TSPLIB’deki standart TSP örnekleri üzerinde test edilmiştir.

## 📁 İçerik

- `main.m`: Algoritmayı çalıştıran ana dosya
- `tspdata/`: TSP problem dosyaları (örn. `berlin52.tsp`)

## 🛠 Gereksinimler

- MATLAB R2016a veya üzeri
- Ekstra toolbox gerektirmez

## 📌 Atıf

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

## 🤝 İletişim ve İş Birliği

📧 E-posta: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
