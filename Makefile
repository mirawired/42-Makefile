#####################################
#### 42 simple Makefile template ####
#####################################

# Program Name
PROG_NAME	= prog_name
NAME		= $(PROG_NAME)

# Compiler
CC		=	gcc						# or clang
# Flags
CFLAGS 	=	-Wall -Wextra -Werror 	# add -g for gdb debug
# Minilibx flags
LFLAGS	=	-lX11 -lXext -lm
# Include folder (takes all *.h in the /inc folder)
INC		=	-I ./inc/

# Minilib path
MLX_PATH	=	minilibx-linux/			# library folder
MLX_NAME	=	libmlx_Linux.a			# program name after compilation
MINILIBX	=	$(MLX_PATH)$(MLX_NAME) 	# Complete path from program folder

# Libft path
LIBFT_PATH	 =	libft/
LIBFT_NAME	 =	libft.a
LIBFT		 =	$(LIBFT_PATH)$(LIBFT_NAME)

# Files folder path
SRC_PATH =	src/
OBJ_PATH =	obj/

# List all *.c
SRC =				main.c	\
					...

# Folder redirections
SRCS = $(addprefix $(SRC_PATH), $(SRC))
OBJS = ${SRCS:${SRC_PATH}%.c=${OBJ_PATH}%.o}

# Main rule
# Remove $(MINILIBX) & $(LFLAGS) if Minilibx is not used
# Remove $(LIBFT) if Libft is not used
$(NAME): $(MINILIBX) $(LIBFT) $(OBJS)
	$(CC) -o $(NAME) $(OBJS) $(MINILIBX) $(LIBFT) $(LFLAGS)

# Rule to compile *.o based on *.c
# Compiles *.o in a separate folder
# Check if the "main.h" file is updated and recompile if true
# => can be set to check multiples *.h
$(OBJ_PATH)%.o:$(SRC_PATH)%.c ./inc/main.h
	mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) $(INC) -o $@ -c $<

# Make MIILIBX
$(MINILIBX):
	$(MAKE) -sC $(MLX_PATH)

# Make LIBFT
$(LIBFT):
	$(MAKE) -sC $(LIBFT_PATH)

#####################################
######### MANDATORY RULES ###########
#####################################

all: $(NAME)

# Delete *.o for project and libraries, delete obj/ directory
clean:
	rm -rdf $(OBJ_PATH)
	$(MAKE) clean -C $(MLX_PATH)
	$(MAKE) clean -C $(LIBFT_PATH)

# Delete all programs
fclean: clean
	rm -f $(NAME)
	rm -f $(LIBFT_PATH)$(LIBFT_NAME)
	rm -f $(MLX_PATH)$(MLX_NAME)

re: fclean all

# If done!
bonus: all

.PHONY: all clean fclean re
