# 3D Maintenance AI — Build Android na Nuvem

## GitHub Actions

1. Crie um repositório no GitHub.
2. Envie todo o conteúdo deste projeto para o repositório.
3. Abra **Actions**.
4. Execute **Build Android APK** usando **Run workflow**.
5. Quando terminar, abra a execução concluída.
6. Em **Artifacts**, baixe `3d-maintenance-ai-apk`.
7. Extraia o ZIP do artifact e instale `app-release.apk` no Android.

O workflow usa Ubuntu, Java 17 e Flutter stable e executa:
- flutter pub get
- flutter analyze
- flutter build apk --release

Observação: este pacote contém o workflow de CI/CD. A geração do APK acontece nos servidores do GitHub Actions após o projeto ser enviado ao GitHub.
