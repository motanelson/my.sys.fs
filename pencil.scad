// PORTA LÁPIS E CANETAS COM TABULEIRO
// Configurações principais

// Dimensões da caixa de lápis
altura_caixa = 90;
largura_caixa = 30;
comprimento_caixa = 30;
espessura = 5;

// Dimensões do tabuleiro
comprimento_tabuleiro = 90;
largura_tabuleiro = 30;
altura_tabuleiro = 20;

// ========== MÓDULOS PRINCIPAIS ==========

// Caixa principal para lápis e canetas
module caixa_lapis() {
    difference() {
        // Caixa externa
        cube([comprimento_caixa, largura_caixa, altura_caixa]);
        
        // Vão interno (com folga de 5mm das bordas)
        translate([espessura, espessura, espessura])
        cube([
            comprimento_caixa - 2*espessura, 
            largura_caixa - 2*espessura, 
            altura_caixa - espessura + 1
        ]);
    }
}

// Tabuleiro para clips, agrafos e elásticos
module tabuleiro() {
    difference() {
        // Base do tabuleiro
        cube([comprimento_tabuleiro, largura_tabuleiro, altura_tabuleiro]);
        
        // Vão interno do tabuleiro
        translate([espessura, espessura, espessura])
        cube([
            comprimento_tabuleiro - 2*espessura,
            largura_tabuleiro - 2*espessura,
            altura_tabuleiro - espessura + 1
        ]);
    }
    
    // Divisórias internas do tabuleiro
    // Divisória central
    translate([comprimento_tabuleiro/2 - 2, 0, 0])
    cube([4, largura_tabuleiro, altura_tabuleiro]);
    
    // Divisórias menores
    translate([comprimento_tabuleiro/4 - 1.5, 0, 0])
    cube([3, largura_tabuleiro, altura_tabuleiro/2]);
    
    translate([3*comprimento_tabuleiro/4 - 1.5, 0, 0])
    cube([3, largura_tabuleiro, altura_tabuleiro/2]);
}

// Base de união entre caixa e tabuleiro
module base_uniao() {
    translate([0, -espessura, 0])
    cube([espessura, largura_caixa + 2*espessura, espessura]);
}

// ========== MONTAGEM FINAL ==========
union() {
    // Caixa de lápis (posição inicial)
    caixa_lapis();
    
    // Base de união
    base_uniao();
    
    // Tabuleiro (posicionado ao lado da caixa)
    translate([-comprimento_tabuleiro, 0, 0])
    tabuleiro();
}

// ========== DECORAÇÃO/IDENTIFICAÇÃO ==========
// Texto "Lápis" na caixa
translate([comprimento_caixa/2, largura_caixa/2, altura_caixa - 2])
linear_extrude(height = 1)
text("LÁPIS", size = 5, halign = "center", valign = "center");

// Texto "Utensílios" no tabuleiro
translate([-comprimento_tabuleiro/2, largura_tabuleiro/2, altura_tabuleiro - 2])
linear_extrude(height = 1)
text("UTENSÍLIOS", size = 4, halign = "center", valign = "center");

// ========== VISUALIZAÇÃO DOS COMPARTIMENTOS ==========
// Visualização dos itens (opcional - remova o % para ver)
%translate([comprimento_caixa/2, largura_caixa/2, altura_caixa/2])
rotate([0, 0, 90])
color("Yellow", 0.3)
cylinder(h = 70, r = 3, $fn = 30);

%translate([-comprimento_tabuleiro/2, largura_tabuleiro/3, altura_tabuleiro/2])
color("Silver", 0.5)
cube([10, 1, 5], center = true);

%translate([-comprimento_tabuleiro/2, 2*largura_tabuleiro/3, altura_tabuleiro/2])
color("Gold", 0.5)
cube([8, 2, 3], center = true);

/*
INSTRUÇÕES DE USO:
1. Renderize (F6) e exporte como STL
2. Imprima com a base na cama de impressão
3. Use preenchimento de 15-20%

PERSONALIZAÇÕES:
- Ajuste 'altura_caixa' para mais/menos lápis
- Modifique 'comprimento_tabuleiro' para mais divisórias
- Altere 'espessura' para paredes mais finas/espessas
*/