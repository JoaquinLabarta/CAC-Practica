;Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos 
;son mayores que X. El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar 
;además otro arreglo llamado RES cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero 
;correspondiente en el arreglo TABLA es mayor que X, mientras que un ‘0’ indicará que es menor o igual. 

.data
tabla: .word 1,2,3,4,5,6,7,8,9,10
x: .word 7
cant: .word 0
resul: .word 0,0,0,0,0,0,0,0,0,0

.text
;carga de datos
lw $t0, x($0)
daddi $t3, $0, 0 ;cant
daddi $t4, $0, 0 ;contador posiciones
daddi $t5, $0, 10 ;dimf
daddi $t7, $0, 1 ;sumador

loop: 
  beqz $t5, fin  ;si llegue a cero termino
  lw $t1, tabla($t4)  ;guardo valor de tabla 
  daddi $t4, $t4, 8  ;me muevo en tabla
  slt $t6, $t0, $t1  ;comparo con x
  dsub $t5, $t5, $t7 ;decremento dimf
  bnez $t6, sumarCANT  ;si dio 1 aumento
  sd $t6, resul($t4)  ;guardo en resultado
  j loop

fin: sd $t3, cant($0)
halt

sumarCANT: daddi $t3,$t3,1
j loop