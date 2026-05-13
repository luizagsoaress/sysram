#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main() {
    char *dirHome = getenv("HOME");
	char path[1024];
	snprintf(path, sizeof(path), "%s/.local/share/sysram/output.txt", dirHome);
    FILE *arq = fopen(path, "a+");
    if(!arq) return 1;
    char linha[1024];
    char *valorTotalRam[1024] = {"Total"};
    char *valorUsadoRam[1024] = {"Usada"};
    char *valorLivreRam[1024] = {"Livre"};
    char *valores[1024] = {0};
    char *token;
    int count = 0;

    while(fgets(linha, sizeof(linha), arq)) {
        linha[strcspn(linha, "\n")] = '\0';
        token = strtok(linha, " ");
        while(token != NULL) {
            valores[count] = strdup(token);
            token = strtok(NULL, " ");
            count++;
        }
    }

    int i = 0;
    int j = 1;

    while(valores[i] != NULL) {
        if(strcmp(valores[i], "Mem.:") == 0 || strcmp(valores[i], "Memory.:") == 0) {
            valorTotalRam[j] = valores[i + 1];
            valorUsadoRam[j] = valores[i + 2];
            valorLivreRam[j] = valores[i + 3];
            j++;
        } else if(strcmp(valores[i], "Swap:") == 0) {
            valorTotalRam[j] = valores[i + 1];
            valorUsadoRam[j] = valores[i + 2];
            valorLivreRam[j] = valores[i + 3];
            j++;
        } 
        i++;
    }
    int x = 0;
    while(valorUsadoRam[x] != NULL) {
        printf("%s\n", valorUsadoRam[x]);   
        x++;
    }

    x = 0;
    while(valorLivreRam[x] != NULL) {
        printf("%s\n", valorLivreRam[x]);   
        x++;
    }


    x = 0;
    while(valorTotalRam[x] != NULL) {
        printf("%s\n", valorTotalRam[x]);   
        x++;
    }

    fclose(arq);

    return 0;
}