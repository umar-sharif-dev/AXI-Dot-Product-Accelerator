"""
# AXI-Based Dot Product Accelerator - Software Emulation
# Version: 1.1
# Author: [Your Name]
# Date: [Insert Date]
# Description: 
# This Python script computes the accumulated sum of the product A[i] * B[i] 
# for i from 1 to 256, emulating the dot product operation in software. 
# The results are written to a text file instead of being printed to the console.
"""

def compute_sum_and_write_to_file(output_filename="dot_product_output.txt"):
    """
    Computes the accumulated sum of the product A[i] * B[i] and writes all values 
    with the running total to a text file.

    - A[i] and B[i] are both 8-bit signed integers.
    - For i from 1 to 127: A[i] = B[i] = i.
    - For i from 128 to 256: A[i] = B[i] = i - 256 (negative values).
    - The final sum accumulates all A[i] * B[i].

    Args:
        output_filename (str): Name of the text file to save the output.

    Returns:
        total_sum (int): The accumulated sum of all products.
    """

    total_sum = 0  # Initialize the total sum accumulator

    # Open a text file in write mode
    with open(output_filename, "w") as file:
        file.write("AXI-Based Dot Product Calculation - Output Log\n")
        file.write("=" * 50 + "\n")
        
        # Iterate over values from 1 to 256 to compute the dot product
        for i in range(1, 257):
            # Determine values of A[i] and B[i] based on i's range
            if i <= 127:
                A_i = i  # Positive values for first half
                B_i = i
            else:
                A_i = i - 256  # Negative values for second half
                B_i = i - 256

            # Compute the product of A[i] and B[i]
            product = A_i * B_i

            # Accumulate the computed product into the running total
            total_sum += product

            # Format and write output to the file
            file.write(f"A[{i}] = {A_i}, B[{i}] = {B_i}, A[{i}] * B[{i}] = {product}, Running Total = {total_sum}\n")

        # Write the final computed sum to the file
        file.write("\nThe accumulated sum of A[i] * B[i] for i from 1 to 256 is: {}\n".format(total_sum))

    return total_sum


# Execute the function and store the final accumulated sum
result = compute_sum_and_write_to_file()

# Notify the user that the results are saved in a text file
print("Computation completed. Output has been saved to 'dot_product_output.txt'.")
