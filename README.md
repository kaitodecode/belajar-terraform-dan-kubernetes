# Terraform Kubernetes Infrastructure

Proyek ini digunakan untuk mengelola infrastruktur Kubernetes menggunakan Terraform.

## Struktur Proyek

```
├── environtments/
│   └── development/       # Konfigurasi environment development
├── modules/
│   └── namespace/         # Modul untuk membuat Kubernetes namespace
├── services/
│   └── nginx/             # Konfigurasi service Nginx
├── .gitignore
├── README.md
├── tfvars.example         # Contoh file variabel
└── versions.tf            # Versi Terraform dan provider
```

## Prasyarat

- Terraform >= 1.3.0
- Akses ke cluster Kubernetes
- Credential Kubernetes (host dan token)

## Cara Menggunakan

1. Salin file `tfvars.example` ke `environtments/development/dev.tfvars`
2. Isi nilai variabel yang diperlukan:
   ```
   kube_host = "your_kubernetes_host"
   kube_token = "your_kubernetes_token"
   ```
3. Inisialisasi Terraform:
   ```bash
   terraform init
   ```
4. Terapkan konfigurasi:
   ```bash
   terraform apply -var-file="environtments/development/dev.tfvars"
   ```

## Modul yang Tersedia

- **namespace**: Membuat namespace Kubernetes
- **nginx**: Deploy service Nginx dasar

## Variabel Sensitif

Beberapa variabel seperti `kube_host` dan `kube_token` ditandai sebagai sensitive dan tidak akan ditampilkan di output Terraform.

## Catatan

- Jangan commit file `.tfvars` yang berisi credential ke version control
- Gunakan file `.tfvars.example` sebagai template