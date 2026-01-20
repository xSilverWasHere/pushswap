<p align="center">
  <img src=https://github.com/xSilverWasHere/42-project-badges/blob/main/covers/cover-push_swap.png alt="PUSH_SWAP"/>
</p>

# 🔁 Push_swap – Efficient Stack Sorting with Limited Operations

Push_swap is a 42 School algorithmic project where the goal is to sort a stack of integers using a limited set of operations and as few moves as possible. It combines linked list manipulation, cost-based decision making, and stack operations to produce an efficient sorting sequence.

## 📚 Project Overview

**Objective:**  
Given a list of integers as arguments, generate and display the smallest possible sequence of operations to sort them in ascending order using only stack operations on two stacks, `a` and `b`.

**Language:** C  

**Deliverable:**  
- An executable `push_swap` that:
  - Parses and validates input.
  - Builds an internal stack representation.
  - Outputs a sequence of operations that sorts the numbers.

## 📦 Contents

### ✅ Mandatory Part

The project revolves around two stacks and a predefined set of allowed operations.

#### 🧱 Stack Representation & Initialization

- Doubly linked list based `t_stack_node` structure storing fields such as:
  - `nbr`, `index`, `above_median`, `push_cost`, `cheapest`, and `target_node`.
- Input parsing:
  - Supports both multiple arguments and a single quoted string, using a custom `split` function.
- Robust initialization:
  - `init_stack_a` converts strings to `long` (via `ft_atol`), checks syntax, range (`INT_MIN`/`INT_MAX`), and detects duplicates before appending nodes to the stack.

#### 🔁 Core Operations

Implemented operations that manipulate the two stacks:

- **Swap:** `sa`, `sb`, `ss`  
  Swap the top elements of one or both stacks.
- **Rotate:** `ra`, `rb`, `rr`  
  Shift all elements up by one, moving the first element to the bottom.
- **Reverse Rotate:** `rra`, `rrb`, `rrr`  
  Shift all elements down by one, moving the last element to the top.
- **Push:** `pa`, `pb`  
  Move the top element from one stack to the other.

Each operation writes its name (e.g., `ra`, `pb`, `sa`) to standard output when executed in visible mode.

#### 🧠 Sorting Strategy

The algorithm adapts to the number of elements:

- For **2 elements**: simple swap if needed (`sa`).
- For **3 elements**: a small optimized routine in `sort_three` using `ra`, `rra`, and `sa` based on the position of the maximum.
- For **more elements**:
  - Initial phase pushes elements from `a` to `b` until only three remain in `a`.
  - For stack `a`:
    - `current_index` marks indices and whether nodes are above or below the median.
    - Each node gets a `target_node` in `b` and a computed `push_cost`.
    - The globally cheapest node is flagged and moved efficiently to stack `b`, using combined rotations (`rr` / `rrr`) when beneficial.
  - After `a` is reduced and sorted with `sort_three`, nodes in `b` are moved back to `a`:
    - `init_nodes_b` sets the best insertion target in `a` for each node in `b`.
    - `move_b_to_a` prepares stack `a` and pushes elements back with `pa`.
  - A final step brings the smallest value to the top of stack `a` with appropriate rotations.

### 🧰 Utilities & Error Handling

- Utility functions:
  - `stack_len`, `find_last`, `find_min`, `find_max`, `stack_sorted` provide core stack queries.
- Error management:
  - `error_syntax` validates numeric format.
  - `error_duplicate` prevents duplicate integers.
  - `free_errors` frees the stack, prints `"Error"` and exits.
- `free_stack` cleans up the doubly linked list once sorting is done.

## ⚙️ Build & Usage

The project is built using a `Makefile` with standard targets.

**Build the executable:**

``make``

Rebuild from scratch:

``make re``

Clean object files:

``make clean``

Remove all built files (including the binary):

``make fclean``

Run the program:

``./push_swap 2 1 3 6 5 8``

Or with a single quoted argument:

``./push_swap "2 1 3 6 5 8"``

The program prints a sequence of operations (sa, pb, ra, etc.) that, when executed, sort the given numbers in ascending order using stacks a and b.

## 🎯 What I Learned

This project provided deeper experience with:

  Algorithm design: Creating a cost-based strategy to minimize the number of operations for stack sorting.

  Linked list manipulation: Implementing and maintaining a doubly linked list with extra metadata (indices, costs, targets).

  Edge case handling: Validating and normalizing input, detecting duplicates, and managing errors gracefully.

  Clean abstractions: Splitting logic across stack utilities, initialization, cost analysis, and operation primitives to keep the code modular and maintainable.


