# Casino slot machine

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S2

  > Team ID: 19

  > Member-1: Rudransh Kumar Ankodia, 231CS249, rudransh.231CS249@nitk.edu.in

  > member-2: Mohnish Hemanth Kumar, 231CS235, mhk.231CS235@nitk.edu.in

  > Member-3: Aman Kumar Singh, 231CS206, amankumarsingh.231cs206@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
       <p>1. Motivation: The reason we chose the casino slot machine project is because it allows us
       to apply our knowledge of digital electronics to a fun and popular concept. We can turn our
       theoretical knowledge into an interactive game by using flip-flops and logic gates in a real-world
       system like a slot machine. Figuring out how to simulate randomness and design the reward
       system within the limitations of the hardware is a challenging task.</p>
       <p>2. Problem Statement: This project aims to design and build a functional casino slot machine
       using only flip-flops, logic gates, and other essential digital components. The machine should
       replicate the critical aspects of a real slot machine, including random outcomes, user interac
        tion, and reward calculations. We aim to implement the slot machine’s control system and
        output display entirely through hardware without relying on software or microcontrollers.</p>
       <p>3. Features:
       <p>(a) Pseudo Random Number Generator using D-flipflops.</p>
       <p>(b) Player Engagement Mechanism using Counters and Registers.</p>
       <p>(c) Reward Distribution Logic.</p>
       <p>(d) Spin Duration Control using logic gates.</p></p>
</details>

## Functional Block Diagram
<details>
  <summary>Detail</summary>
  
  <img src = "Snapshots/slot_machine1.png">

</details>

<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary>
  <h1> How does it work?</h1>
  Our Casino Slot Machine has 3 Seven Segment display's which display the Slot numbers. We use BCD to 7 segment display decoder to display the numbers.The numbers on the display are generated by LFSR(Linear Feedback Shift Registers) which generate Pseudo Random Numbers. Each of the the Random Number Generator is connected to clocks of different frequencies which help in preserving the randomness of the displayed numbers.To make sure the player Engages with the machine we have made sure that the player wins atleast ones in every 16 trials using a 4 bit counter. The machine also generates Binary Sequences based on the players input. If the player pay's 500rs it generates a sequence 1001 which repeats untill the user stops paying that amount. Whenever the user gets 1 in the sequence 7 7 7 is forced to be  displayed in the Random Number Generator. Similary we have a sequence 01001 if the user pays 5000rs. The Machine has a RESET button which resets the counter.The machine has a START button which is the main button to start each trial.The numbers keep on changing untill we hold the start button and stops when we release it.
  <h1>How does the game work?</h1>
  The Slot Machine has a minimum price of 50rs to play each trial. We start by holding the start button and releasing it after a while. If you manage to get the same number on all the three displays you will win 250rs. If you want to increase your chances of winning then you can increase the pay to either 500 of 5000 or both(5500) by turning the respective button On. If you press any of these buttons and manage to win then you will recieve either 1000rs , 10000rs or 11000 based on your input. To end the game and collect your money click on the RESET button.
</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  <img src="Snapshots/Logisim-snapshot.png">
</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  > Neatly update the Verilog code in code style only.
</details>

## References
<details>
  <summary>Detail</summary>
  
 1. https://www.analog.com/en/resources/design-notes/random-number-generation-using-lfsr
 2. https://electronics.stackexchange.com/questions/229590/logic-gates-creating-a-digital-counter
 3. https://stackoverflow.com/questions/4137927/slot-machine-payout-calculation
   
</details>


