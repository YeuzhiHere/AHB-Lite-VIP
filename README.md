# AHB-Lite-VIP

## TestBench Components
* Transaction Class
* Generator Class
* Interface
* Driver Class
* Monitor Class
* Scoreboard Class
* Environment Class
* Test
* TestBench Top

### Transaction Class
* Fields required to generate the stimulus are declared in the transaction class.
* Transaction class can also be used as a placeholder for the activity monitored by the monitor on DUT signals.
* So, the first step is to declare the Fields‘ in the transaction class.

### Generator Class
 Generator class is responsible for:
* Generating the stimulus by randomizing the transaction class
* Sending the randomized class to driver

### Interface:
* Interface will group the signals, specifies the direction (Modport) and Synchronize the signals(Clocking Block).

### Driver Class
 Driver class is responsible for:
* receive the stimulus generated from the generator and drive to DUT by assigning transaction class values to interface signals.

### Monitor Class
* Samples the interface signals and converts the signal level activity to the transaction level.
* Send the sampled transaction to Scoreboard via Mailbox.

### Scoreboard Class
* Scoreboard receives the sampled packet from monitor and compares the results.

### Environment
* Environment is container class contains Mailbox, Generator, Driver, Monitor and Scoreboard.

### Test
Test code is written with the program block.
The test is responsible for:
* Creating the environment.
* Configuring the testbench i.e, setting the type and number of transactions to be generated.
* Initiating the stimulus driving.

### TestBench Top
* This is the topmost file, which connects the DUT and TestBench.
* TestBench top consists of DUT, Test and Interface instances.
* The interface connects the DUT and TestBench.

## Supported Simulators & Tools
- [x] Aldec Riviera Pro 2020.04
- [x] Cadence Xcelium 20.09
- [x] Mentor Questa 2021.3
- [x] Synopsys VCS 2020.03

## Supported Tests
- [x] Single Burst
- [x] Increment Burst of Undefined Length
- [x] INCR & WRAP Tests (4,8,16 Beats)

## How to run tests

1. Change contraints in the `transaction.sv` file according to the test you want to run.
2. Comment/uncomment the tests to be run in the `environment.sv` file.
3. You can change the number of transactions to be run from the `test.sv` file by changing `repeat_count` value.
