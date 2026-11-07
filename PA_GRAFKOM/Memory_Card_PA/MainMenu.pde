class MainMenu {
  PImage bgImage;
  PImage playImg, quitImg, soundImg;

  // Ukuran dan Koordinat Hitbox (Modul 4)
  float playX, playY, playW, playH;
  float quitX, quitY, quitW, quitH;
  float soundX, soundY, soundW, soundH;

  boolean isHoverPlay = false;
  boolean isHoverQuit = false;
  boolean isHoverSound = false;

  MainMenu() {
    bgImage  = loadImage("Main Menu.png");
    playImg  = loadImage("button play.png");
    quitImg  = loadImage("button quit.png");
    soundImg = loadImage("button sound.png");
  }

  void updateDimensions() {
    // Presisi koordinat tombol menutupi template gambar background

    // 1. Tombol PLAY
    playW = width * 0.150;
    playH = height * 0.100;
    playX = width / 2 - playW / 2;
    playY = height * 0.545;

    // 2. Tombol QUIT
    quitW = width * 0.150;
    quitH = height * 0.100;
    quitX = width / 2 - quitW / 2;
    quitY = height * 0.662;

    // 3. Tombol SOUND (Persegi 1:1)
    soundH = height * 0.090;
    soundW = soundH; 
    soundX = width / 2 - soundW / 2;
    soundY = height * 0.775;
  }

  void display() {
    updateDimensions();

    // Render Background Utama
    if (bgImage != null) {
      image(bgImage, 0, 0, width, height);
    } else {
      background(255, 192, 218);
    }

    // Hitbox Deteksi Kursor (Modul 4)
    isHoverPlay = mouseX >= playX && mouseX <= playX + playW &&
                  mouseY >= playY && mouseY <= playY + playH;

    isHoverQuit = mouseX >= quitX && mouseX <= quitX + quitW &&
                  mouseY >= quitY && mouseY <= quitY + quitH;

    isHoverSound = mouseX >= soundX && mouseX <= soundX + soundW &&
                   mouseY >= soundY && mouseY <= soundY + soundH;

    if (isHoverPlay || isHoverQuit || isHoverSound) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }

    // Render Tombol PLAY
    if (isHoverPlay) {
      image(playImg, playX - 3, playY - 2, playW + 6, playH + 4);
    } else {
      image(playImg, playX, playY, playW, playH);
    }

    // Render Tombol QUIT (Menggunakan quitY secara presisi)
    if (isHoverQuit) {
      image(quitImg, quitX - 3, quitY - 2, quitW + 6, quitH + 4);
    } else {
      image(quitImg, quitX, quitY, quitW, quitH);
    }

    // Render Tombol SOUND
    if (isHoverSound) {
      image(soundImg, soundX - 2, soundY - 2, soundW + 4, soundH + 4);
    } else {
      image(soundImg, soundX, soundY, soundW, soundH);
    }
  }

  void checkClick() {
    if (isHoverPlay) {
      cursor(ARROW);
      loadingScreen.startLoading(); // Reset timer 5 detik loading
      gameState = 2;                // Pindah ke Loading Screen
    } 
    else if (isHoverQuit) {
      exit(); // Keluar dari game
    } 
    else if (isHoverSound) {
      println("Tombol Sound diklik!");
    }
  }
}
