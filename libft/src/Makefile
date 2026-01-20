NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror
CPPFLAGS = -I../inc

# Core sources: all .c directly under this directory
SRCS_CORE := $(wildcard *.c)
# gnl
SRCS_GNL :=

SRCS := $(SRCS_CORE)
OBJS := $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
