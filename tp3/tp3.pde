// TP2 Luciano Kasalaba 119059/2
// Comision1 

PImage obra;
int numSquaresLarge = 5; // Número de cuadrados grandes en cada posición
int numSquaresCenter = 8; // Número de cuadrados pequeños en el cuadro central
float gapLarge;
float gapCenter;
float rotationAngle = 0; // Ángulo de rotación inicial

void setup() {
  size(800, 400);
  background(155);
  obra = loadImage("obra.png"); // Cargar la imagen desde el directorio actual
  gapLarge = 160 / (float) numSquaresLarge; // Ajustar el valor de gap para los cuadrados grandes
  gapCenter = 160 / (float) numSquaresCenter; // Ajustar el valor de gap para los cuadrados pequeños en el centro
}

void draw() {
  background(0);
  image(obra, 0, 0, 400, 400);  // Colocar la imagen en la mitad izquierda

  // Dibujar los cuadrados grandes
  drawLargeSquares();

  // Dibujar el cuadrado central
  drawCenterSquares();
  
  // Dibujar un cuadrado negro chiquito en el centro
  drawSmallBlackSquare();
}

// Función para dibujar los cuadrados grandes
void drawLargeSquares() {
  float size = 160; // Tamaño de cada cuadrado grande

  // Coordenadas para los 4 grupos de cuadrados grandes
  float[][] positions = {
    {width / 2 + 20, 20},
    {width - 180, 20},
    {width / 2 + 20, height - 180},
    {width - 180, height - 180}
  };

  pushMatrix(); // Guardar la matriz de transformación actual

  // Aplicar la rotación a todos los cuadrados grandes
  translate(width / 2, height / 2);
  rotate(radians(rotationAngle));
  translate(-width / 2, -height / 2);

  for (int i = 0; i < positions.length; i++) {
    float x = positions[i][0];
    float y = positions[i][1];
    
    for (int j = numSquaresLarge; j > 0; j--) {
      float squareSize = j * gapLarge;
      float posX = x + (size - squareSize) / 2;
      float posY = y + (size - squareSize) / 2;

      // Verificar si el mouse está sobre este cuadrado
      if (mouseX >= posX && mouseX <= posX + squareSize && mouseY >= posY && mouseY <= posY + squareSize) {
        // Cambiar el color suavemente
        fill(mouseX % 2 == 0 ? 255 : 0); // Cambia de color dependiendo de la posición del mouse
      } else {
        fill(j % 2 == 0 ? 0 : 255); // Negro para los cuadrados pares, blanco para los impares
      }
      
      noStroke();
      rect(posX, posY, squareSize, squareSize);
    }
  }

  popMatrix(); // Restaurar la matriz de transformación anterior
}

// Función para dibujar los cuadrados pequeños en el centro
void drawCenterSquares() {
  float centerSize = 160; // Tamaño del cuadrado del centro
  float centerX = width / 2 + 200 - centerSize / 2;
  float centerY = height / 2 - centerSize / 2;

  pushMatrix(); // Guardar la matriz de transformación actual

  // Aplicar la rotación a todos los cuadrados pequeños en el centro
  translate(width / 2, height / 2);
  rotate(radians(rotationAngle));
  translate(-width / 2, -height / 2);

  for (int i = numSquaresCenter; i > 0; i--) {
    float squareSize = i * gapCenter;
    float posX = centerX + (centerSize - squareSize) / 2;
    float posY = centerY + (centerSize - squareSize) / 2;

    // Verificar si el mouse está sobre este cuadrado
    if (mouseX >= posX && mouseX <= posX + squareSize && mouseY >= posY && mouseY <= posY + squareSize) {
      // Cambiar el color suavemente
      fill(mouseX % 2 == 0 ? 255 : 0); // Cambia de color dependiendo de la posición del mouse
    } else {
      fill(i % 2 == 0 ? 0 : 255); // Negro para los cuadrados pares, blanco para los impares
    }

    noStroke();
    rect(posX, posY, squareSize, squareSize);
  }

  popMatrix(); // Restaurar la matriz de transformación anterior
}

// Función para dibujar un cuadrado negro chiquito en el centro
void drawSmallBlackSquare() {
  float centerSize = 160; // Tamaño del cuadrado del centro
  float smallSquareSize = 20; // Tamaño del cuadrado negro chiquito
  float centerX = width / 2 + 200 - centerSize / 2;
  float centerY = height / 2 - centerSize / 2;
  float smallSquareX = centerX + (centerSize - smallSquareSize) / 2;
  float smallSquareY = centerY + (centerSize - smallSquareSize) / 2;

  pushMatrix(); // Guardar la matriz de transformación actual

  // Aplicar la rotación al cuadrado negro chiquito en el centro
  translate(width / 2, height / 2);
  rotate(radians(rotationAngle));
  translate(-width / 2, -height / 2);

  fill(0); // Negro
  rect(smallSquareX, smallSquareY, smallSquareSize, smallSquareSize);

  popMatrix(); // Restaurar la matriz de transformación anterior
}

void mouseClicked() {
  // Incrementar el ángulo de rotación al hacer clic
  rotationAngle += 80;
}
