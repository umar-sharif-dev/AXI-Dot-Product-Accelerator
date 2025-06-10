# Andromeda Project
Andromeda is an AI accelerator for LLM implementation on FPGAs

## Setup Instructions

1. To create a new Vivado project:
    ```bash
    cd Vivado 
    ```
2. To create a new Vitis application:
    ```bash
    cd Vitis 
    ```
3. For more information, use the help command in the respective directory [Vivado or Vitis]:
    ```bash
    make help
    ```
4. When ready to push changes to the Github repo: kindly execute below command in the main **andromeda** directory:
    ```bash
    make prep_git_push TARGET=<val>
    ```
    where val= alinx|puzhi
