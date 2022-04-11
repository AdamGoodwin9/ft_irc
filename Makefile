NAME = ircserv

ARGS = 6667 Password123

SRCS_DIR = src/

INCS	=	Utils/Utils.hpp \
				Server/Config/Config.hpp \
				Server/Display/Display.hpp \
				Server/Channel/Channel.hpp \
				Server/Server.hpp \
				User/Command/Command.hpp \
				User/User.hpp

SRCS    =       Utils/Utils.cpp \
				Server/Config/Config.cpp \
				Server/Display/Display.cpp \
				Server/Channel/Channel.cpp \
				Server/Server.cpp \
				User/Command/Connection/PASS.cpp \
				User/Command/Connection/NICK.cpp \
				User/Command/Connection/USER.cpp \
				User/Command/Connection/OPER.cpp \
				User/Command/Connection/MODE.cpp \
				User/Command/Connection/SERVICE.cpp \
				User/Command/Connection/QUIT.cpp \
				User/Command/Connection/SQUIT.cpp \
				User/Command/Channel/JOIN.cpp \
				User/Command/Channel/PART.cpp \
				User/Command/Channel/TOPIC.cpp \
				User/Command/Channel/NAMES.cpp \
				User/Command/Channel/LIST.cpp \
				User/Command/Channel/INVITE.cpp \
				User/Command/Channel/KICK.cpp \
				User/Command/Sending/PRIVMSG.cpp \
				User/Command/Sending/NOTICE.cpp \
				User/Command/Server/MOTD.cpp \
				User/Command/Server/LUSERS.cpp \
				User/Command/Server/VERSION.cpp \
				User/Command/Server/STATS.cpp \
				User/Command/Server/LINKS.cpp \
				User/Command/Server/TIME.cpp \
				User/Command/Server/CONNECT.cpp \
				User/Command/Server/TRACE.cpp \
				User/Command/Server/ADMIN.cpp \
				User/Command/Server/INFO.cpp \
				User/Command/Service/SERVLIST.cpp \
				User/Command/Service/SQUERY.cpp \
				User/Command/User/WHO.cpp \
				User/Command/User/WHOIS.cpp \
				User/Command/User/WHOWAS.cpp \
				User/Command/Miscellaneous/KILL.cpp \
				User/Command/Miscellaneous/PING.cpp \
				User/Command/Miscellaneous/PONG.cpp \
				User/Command/Miscellaneous/ERROR.cpp \
				User/Command/Optional/AWAY.cpp \
				User/Command/Optional/REHASH.cpp \
				User/Command/Optional/DIE.cpp \
				User/Command/Optional/RESTART.cpp \
				User/Command/Optional/SUMMON.cpp \
				User/Command/Optional/USERS.cpp \
				User/Command/Optional/WALLOPS.cpp \
				User/Command/Optional/USERHOST.cpp \
				User/Command/Optional/ISON.cpp \
				User/Command/Command.cpp \
				User/Command/replies.cpp \
				User/User.cpp \
				main.cpp


FLAGS = -std=c++98 -Wall -Wextra -Werror

OBJS_DIR        =       obj/
OBJ             =       $(SRCS:.cpp=.o)
OBJS            =       $(addprefix $(OBJS_DIR), $(OBJ))

dir_guard=@mkdir -p $(@D)


$(OBJS_DIR)%.o : $(SRCS_DIR)%.cpp
		$(dir_guard)
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