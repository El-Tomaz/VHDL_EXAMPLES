# SIMPLE ADDER

this is a simple adder circuit, based on std_logic_vector.


error: 
ghdl:error: bound check failure at ./simple_adder.vhdl:18
ghdl:error: simulation failed

^^^^^ tava dando esse erro, sabe porque ? 
porque eu tava fazendo X <= A+B;
so que ai A e B sao de 4 bits, e X é de 5
o vhdl nao consegue sozinho fazer a extensao;
entao dentro da arquitetura do adder1 eu tive que fazer a extensao de A e B durante a soma,
ficou assim: x <= (A(3)&A) + (B(3)&B);
lembrando que "&" em vhdl e a concatenacao.
eu nao sabia mas pra extender um numero signed, com bit de sinal, basta voce ter que repetir o ultimo bit de sinal (nao precisa alterar o resto, eu tava achando que precisava zerar o quarto bit e colocar o bit de sinal mas nao precisa, tudo isso vem da aritimetica do complemento de 2).

must add -fsynopsys to use ieee.std_logic_arith
