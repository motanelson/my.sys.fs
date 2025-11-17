asm (".global _var16k \n_var16k:\n .space 16384");
extern char *_var16k;
int _start(){
    char *a=_var16k;    
    return 0;

}