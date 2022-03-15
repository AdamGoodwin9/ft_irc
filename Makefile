NAME = ircserv

ARGS = 6667 Password123

SRCS_DIR = ./
SRCS =  main.cpp \
                vectorTest.cpp \
                stackTest.cpp \
                mapTest.cpp

FLAGS = -std=c++98 -Wall -Wextra -Werror

OBJS_DIR        =       obj/
OBJ             =       $(SRCS:.cpp=.o)
OBJS            =       $(addprefix $(OBJS_DIR), $(OBJ))

$(OBJS_DIR)%.o :        $(SRCS_DIR)%.cpp
        @mkdir -p $(OBJS_DIR)
        @echo "Compiling: $<"
        @clang++ $(FLAGS) -c $< -o $@

$(NAME): $(OBJS)
        @echo "Creating $(NAME)"
        @clang++ $(FLAGS) -o $(NAME) $(OBJS)

all: $(NAME)

clean:
        @echo "Deleting $(OBJS_DIR)"
        @rm -rf $(OBJS_DIR)

fclean: clean
        @echo "Deleting $(NAME)"
        @rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re