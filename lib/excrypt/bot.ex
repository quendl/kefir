defmodule Excrypt.Bot do
  @bot :excrypt

  use ExGram.Bot,
    name: @bot,
    setup_commands: true

  # commands of the bot
  command("start")
  command("help", description: "Print the bot's help")
  command("github", description: "Returns the GitHub link")

  # middleware integration
  middleware(ExGram.Middleware.IgnoreUsername)

  @spec bot :: :excrypt
  def bot(), do: @bot

  # bot commands
  def handle({:command, :start, _msg}, context) do
    answer(context, "Hello there! I am the Telegram integration for Quendl.")
  end

  def handle({:command, :github, _msg}, context) do
    answer(context, "Here is your link: https://github.com/quendl/kefir")
  end

  # main command
  def handle({:command, :help, _msg}, context) do
    answer(context, get_help())
  end

  # This can be used to avoid hard coded answer contexts
  # Tho I would only use this if the answer is longer than one line.
  def get_help() do
    """
    This bot has the following commands
    /start - starts the bot with an introduction
    /help - sends the help menu
    /github - returns the github link
    """
  end
end
