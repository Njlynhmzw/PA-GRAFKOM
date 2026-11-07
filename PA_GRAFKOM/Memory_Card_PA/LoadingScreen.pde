class LoadingScreen {
  PImage bgImage;
  int startTime = 0;
  boolean isStarted = false;

  LoadingScreen() {
    bgImage = loadImage("Loading Screen.png");
  }

  void startLoading() {
    startTime = millis();
    isStarted = true;
  }

  void display() {
    if (!isStarted) {
      startLoading();
    }

    // Background
    if (bgImage != null) {
      image(bgImage, 0, 0, width, height);
    } else {
      background(185, 220, 245);
    }

    // Progress 5 detik
    float elapsedTime = millis() - startTime;
    float progress = constrain(elapsedTime / 5000.0, 0.0, 1.0);

    // Koordinat kapsul (acuan gambar 1920x1080, proporsional)
    float capsW = width * 0.629;
    float capsH = height * 0.0796;
    float capsX = (width - capsW) / 2;
    float capsCenterY = height * 0.5907;

    // Padding dalam kapsul
    float padX = width * 0.010;
    float padY = height * 0.011;

    // Isian progress, tepat di tengah vertikal kapsul
    float fillH = capsH - padY * 2;
    float fillY = capsCenterY - fillH / 2;
    float fillX = capsX + padX;
    float maxFillW = capsW - padX * 2;
    float fillW = maxFillW * progress;

    noStroke();
    fill(210, 110, 180);

    if (fillW > 2) {
      float r = min(fillH / 2, fillW / 2);
      rect(fillX, fillY, fillW, fillH, r);
    }

    // Selesai -> Gameplay
    if (progress >= 1.0) {
      isStarted = false;
      gameState = 3;
    }
  }
}
