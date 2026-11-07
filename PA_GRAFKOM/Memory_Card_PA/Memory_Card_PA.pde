// Game State: 0 = SPLASH, 1 = MAIN_MENU, 2 = LOADING, 3 = GAMEPLAY
int gameState = 0; 

PImage imgSplash;
MainMenu mainMenu;
LoadingScreen loadingScreen;

int splashStartTime = -1; // Menghitung timer 3 detik presisi dari saat gambar tampil

void setup() {
  fullScreen(); // Layar Penuh (Modul 1)
  background(185, 215, 245); // Menutup warna abu-abu bawaan Processing saat awal run
  
  imgSplash = loadImage("Splash Game.png");
  mainMenu = new MainMenu();
  loadingScreen = new LoadingScreen();
}

void draw() {
  // Mencatat detik awal tepat saat visual pertama kali siap
  if (splashStartTime == -1) {
    splashStartTime = millis();
  }

  if (gameState == 0) {
    // 1. Splash Screen Tampil Tepat 3 Detik dari Saat Pertama Muncul di Layar
    image(imgSplash, 0, 0, width, height);
    if (millis() - splashStartTime >= 3000) {
      gameState = 1; // Pindah otomatis ke Main Menu
    }
  } 
  else if (gameState == 1) {
    // 2. Main Menu
    mainMenu.display();
  } 
  else if (gameState == 2) {
    // 3. Loading Screen 5 Detik
    loadingScreen.display();
  } 
  else if (gameState == 3) {
    // 4. Layar Gameplay Placeholder
    background(255, 230, 240);
    fill(120, 50, 100);
    textAlign(CENTER, CENTER);
    textSize(36);
    text("LAYAR GAMEPLAY", width/2, height/2 - 20);
    textSize(20);
    fill(150, 80, 130);
    text("(Menunggu desain gameplay)", width/2, height/2 + 30);
  }
}

void mousePressed() {
  if (gameState == 1) {
    mainMenu.checkClick();
  }
}
