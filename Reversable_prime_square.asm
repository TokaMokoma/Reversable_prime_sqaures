#=========================================================================
#Author :Toka Joseph Mokoma
#Program_name: Reversable Prime Sqaure
#function: prints and determines the first 10  reversable Prime Sqaures
#=========================================================================
.data
	newline: .asciiz "\n"
.text


main:
addi	$s1,$0,0	#k
addi	$s2,$0,0	#count
addi	$s3,$0,0	#s
addi	$s4,$0,0	#x
addi	$s5,$0,0	#l	
addi	$t1,$0,10	#to help break when count ==10
addi	$t7,$zero,1

for_main:
move	$a1,$s1
bgez	$a1,if_1
j	endmain
if_1:
jal	reverse
move	$s7,$v1
move	$v1,$zero
move	$a1,$s1
jal	perfect_sqr
move	$t4,$v0
move	$v0,$zero
beq	$t4,$t7,if_2
j	loop_end
if_2:
move	$a1,$s3
jal	perfect_sqr
move	$t3,$v0
move	$v0,$zero
beq	$t3,$t7,if_3
j	loop_end
if_3:
move	$a1,$s1
jal	Square_root
move	$s4,$v1
move	$v1,$zero
move	$a1,$s3
jal	Square_root
move	$s5,$v1
move	$v1,$zero
move	$a1,$s4
jal	prime_checker
move	$t2,$v0
move	$v0,$zero
beq	$t2,$t7,if_4
j	loop_end
if_4:
move	$a1,$s5
jal	prime_checker
move	$t2,$v0
move	$v0,$zero
beq	$t2,$t7,if_5		#if_5
j	loop_end
if_5:
bne	$s1,$s3,final_execution
j	loop_end
final_execution:
li	$v0,1
add	$a0,$zero,$s1
syscall
addi	$s2,$s2,1
li	$v0,4
la	$a0,newline
syscall
beq	$s2,$t1,endmain
j	loop_end	
loop_end:
addi	$s1,$s1,1
move	$v1,$zero
move	$v0,$zero
move	$a1,$zero
move	$t2,$zero
move	$s3,$zero
move	$v0,$zero
j	for_main

endmain:
li $v0,10
syscall
##################################################################################################################################################
reverse:
 
 addi $sp,$sp,-20    # a stack to hold 20 bits

 sw $t1,0($sp) 
 sw $t2,4($sp)
 sw $t3,8($sp)
 sw $t4,12($sp)
 sw $t5,16($sp)
 
 # intializing everything to zero
 move $t3,$0
 move $t1,$0
 move $t2,$0
 move $t4,$0
 move $t5,$0
   
addi $t3,$zero,0    #int reverse=0;
addi $t5,$zero,10
while:
    beq $a1,0,return_reverse  # while(num!=0)
    div    $a1,$t5
    mfhi ,$t4                # r=num%10;
    mul $t2,$t3,10           # reverse*10
    add $t3,$t2,$t4          # reverse= (reverse*10)+r;
    div  $a1,$t5
    mflo ,$a1               # num=num/10;
    j while
   
    
    return_reverse:
    add $v1,$zero,$t3  
    
lw	$t1,0($sp)
lw	$t2,4($sp)	
lw	$t3,8($sp)
lw      $t4,12($sp)
lw	$t5,16($sp)		
addi	$sp,$sp,20 
    
    jr $ra
########################################################################################################################   
    
    
prime_checker:

addi $sp,$sp,-20    # a stack to hold 20 bits

sw $t1,0($sp) 
sw $t2,4($sp)
sw $t3,8($sp)
sw $t4,12($sp)
sw $t5,16($sp)

# intializing everything to zero
 move $t1,$0
 move $t2,$0
 move $t3,$0
 move $t4,$0
 move $t5,$0
 

addi $t2,$zero,1            #	bool isPrime=true;          
addi $t3,$zero,2            # int i = 2

beq $a1,$t2,is_not_Prime # # if num==1 return is not prime
beqz $a1, is_not_Prime  # if num==0 return is not prime

div $a1,$t3
mflo $t4                   # (num)/2

while_P:                   
bgt  $t3,$t4 isPrime #if i <= (num)/2
div $a1,$t3
mfhi $t5           # num%i 
j if 

if:                 #if(num%i == 0)                    
beqz $t5,is_not_Prime
addi $t3,$t3,1        # i++
j while_P

is_not_Prime:        #isPrime=false;
addi $t2,$zero,0         
j   isPrime         

          

isPrime:        #isPrime=true;

add $v1,$zero,$t2

lw $t1,0($sp) 
lw $t2,4($sp)
lw $t3,8($sp)
lw $t4,12($sp)
lw $t5,16($sp)
addi $sp,$sp,20
jr $ra

#############################################################################################################################################

not_palindrome:
addi	$sp,$sp,-24
#sw	$a1,12($sp)
sw	$t1,0($sp)
sw	$t2,4($sp)	#isTrue
sw	$t3,8($sp)
sw	$t4,16($sp)
sw	$t5,20($sp)
#set everything to zero
move	$t1,$0
move	$t2,$0
move	$t3,$0
move	$t4,$0
move	$t5,$0

addi	$t2,$t0,1
jal	 reverse

addi	$sp,$sp,-24
#sw	$a1,12($sp)
sw	$t1,0($sp)
sw	$t2,4($sp)	#is True
sw	$t3,8($sp)
sw	$t4,16($sp)
sw	$t5,20($sp)
#set everything to zero
move	$t1,$0
move	$t2,$0
move	$t3,$0
move	$t4,$0
move	$t5,$0

addi	$t2,$t0,1   # is True
beq	$v1,$a1,return0_1  # if the output from the reverse function == argument of not_palindrome function set is false else is true
j	end3
return0_1:
move	$t2,$0  # is False
j	end3
end3:
move	$v0,$t2 
#lw	$a1,12($sp)
lw	$t1,0($sp)
lw	$t2,4($sp)	
lw	$t3,8($sp)
lw	$t4,16($sp)
lw	$t5,20($sp)
addi	$sp,$sp,24
jr	$ra
    

##############################################################################################################################################
perfect_sqr:

addi $sp,$sp,-24    # a stack to hold 24 bits

sw $t1,0($sp) 
sw $t2,4($sp)
sw $t3,8($sp)
sw $t4,12($sp)
sw $t5,16($sp)
sw $t6,20($sp)

# intializing everything to zero
 move $t1,$0
 move $t2,$0
 move $t3,$0
 move $t4,$0
 move $t5,$0
 move $t6,$0

addi $t2,$zero,1 # i = 1
addi $t6,$zero,0 # perfect_sqr is_false

for:
mul $t3,$t2,$t2 # $t3 = i*i
mflo $t3
ble $t3,$a1,if_ps  #i * i <= num
j is_false      # if i*i >= num the num is not a perfect square

if_ps:             # if num % i == 0
div $t1,$t2   
mfhi $t4        # num % i
beqz $t4,if2_ps    #num % i == 0

if2_ps:            # if num / i == 1
div $a1,$t2
mflo $t5        # num / i
beq $t5,$t2,is_true   #num / i == 1
addi $t2,$t2,1   # i++
j for

is_true:
addi $t6,$0,1
j finish

is_false:
addi $t6,$zero,0
j finish

finish:
add $v0,$0,$t6

lw $t1,0($sp) 
lw $t2,4($sp)
lw $t3,8($sp)
lw $t4,12($sp)
lw $t5,16($sp)
addi $sp,$sp,24
jr $ra

###################################################################################################################################
Square_root:
addi	$sp,$sp,-24
sw	$a1,20($sp)	# value
sw	$t1,0($sp)	# sqroot
sw	$t2,4($sp)	# counter	
sw	$t3,8($sp)	
sw	$t4,12($sp)
sw	$t5,16($sp)
# intializing everything to zero
move	$t1,$0
move	$t2,$0
move	$t3,$0
move	$t4,$0
move	$t5,$0
move	$v0,$zero

addi	$t1,$0,1   
addi	$t2,$0,1
beqz	$a1,return_value  # if value = 0 return value(0)
beq	$a1,$t1,return_value # if value = 1 return value(1)
while2:
ble	$t1,$a1,L4 # if value is >= $t1 jump to L4 else jump to output
j	output
L4:
addi	$t2,$t2,1  # icreamenting $t2 by 1
mult	$t2,$t2    
mflo	$t1
j	while2     # jump to while2
output:
subi	$t7,$t2,1    
add	$v1,$0,$t7
j	end5
return_value:
move	$t7,$a1
j	end5
end5:
add	$v1,$0,$t7
#lw	$a1,12($sp)
lw	$t1,0($sp)
lw	$t2,4($sp)	
lw	$t3,8($sp)
lw	$t4,12($sp)
lw	$t5,16($sp)
addi	$sp,$sp,24
jr	$ra


  
    