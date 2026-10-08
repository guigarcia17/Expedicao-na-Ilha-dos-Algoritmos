#include "raylib.h"

int main(void)
{
    const int larguraTela = 800;
    const int alturaTela = 450;

    InitWindow(larguraTela, alturaTela, "Expedicao na Ilha dos Algoritmos");
    SetTargetFPS(60);

    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Expedicao na Ilha dos Algoritmos", 190, 200, 20, DARKGRAY);
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
