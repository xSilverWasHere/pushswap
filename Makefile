# ---- Project ---------------------------------------------------------------
NAME	:= push_swap

# ---- Paths -----------------------------------------------------------------
INC_DIR		:= inc
SRC_DIR		:= src
OBJ_DIR		:= obj
LIBFT_DIR  := libft/src
LIBFT_A    := $(LIBFT_DIR)/libft.a
PRINTF_DIR := $(LIBFT_DIR)/ft_printf
PRINTF_A   := $(PRINTF_DIR)/libftprintf.a
LIBFT_INC  := libft/inc


# ---- Tools & Flags ---------------------------------------------------------
CC			:= gcc
CFLAGS		:= -Wall -Wextra -Werror
LDFLAGS	:= -no-pie
CPPFLAGS	:= -I$(INC_DIR) -I$(LIBFT_INC)
RM			:= rm -f

# ---- Sources ---------------------------------------------------------------
SRC	:= \
	$(SRC_DIR)/operations/push.c \
	$(SRC_DIR)/operations/rev_rotate.c \
	$(SRC_DIR)/operations/rotate.c \
	$(SRC_DIR)/operations/sort_stacks.c \
	$(SRC_DIR)/operations/sort_three.c \
	$(SRC_DIR)/operations/swap.c \
	$(SRC_DIR)/push_swap/handle_errors.c \
	$(SRC_DIR)/push_swap/init_a_to_b.c \
	$(SRC_DIR)/push_swap/init_b_to_a.c \
	$(SRC_DIR)/push_swap/push_swap.c \
	$(SRC_DIR)/push_swap/split.c \
	$(SRC_DIR)/push_swap/stack_init.c \
	$(SRC_DIR)/push_swap/stack_utils.c

OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# ---- Rules -----------------------------------------------------------------
all: $(NAME)

$(NAME): $(LIBFT_A) $(PRINTF_A) $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(PRINTF_A) $(LDFLAGS) -o $(NAME)

$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)

$(PRINTF_A):
	$(MAKE) -C $(PRINTF_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) -r $(OBJ_DIR)
	$(MAKE) -C $(LIBFT_DIR) clean
	$(MAKE) -C $(PRINTF_DIR) clean

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT_A)
	$(RM) $(PRINTF_A)
	$(MAKE) -C $(PRINTF_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
