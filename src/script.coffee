# Description
#   A Hubot script to send anonymous messages
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_ANON_TO
#
# Commands:
#   hubot anon <message> - Send message to default channel
#   hubot anon <#channel> <message> - Send message to #channel
#
# Author:
#   lgaticaq

module.exports = (robot) ->
  robot.respond /anon (.+)$/i, (res) ->
    args = res.match[1].trim().split(/\s+/)
    channel = args[0]
    unless /^#/.test(channel)
      channel = process.env.HUBOT_ANON_TO or "#random"
    else
      args.shift()
    text = args.join(" ")
    try
      robot.messageRoom(channel, text)
      from = res.message.user.name
      res.send("""@#{from} send "#{text}" to #{channel}""")
    catch err
      res.reply("an error has occurred: #{err.message}")
      robot.emit("error", err)
