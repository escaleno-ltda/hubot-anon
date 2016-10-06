# Description:
#   A Hubot script to send anonymous messages
#
# Configuration:
#   HUBOT_ANON_TO
#
# Commands:
#   hubot anon <message> - Send message to default channel
#   hubot anon <#channel> <message> - Send message to #channel
#
# Author:
#   @lgatica

module.exports = (robot) ->
  robot.respond /anon (.+)$/i, (res) ->
    from = res.message.user.name
    args = res.match[1].trim().split(/\s+/)
    to = args[0]
    channel = robot.adapter.client.rtm.dataStore.getChannelByName(to)
    if typeof channel is "undefined"
      to = process.env.HUBOT_ANON_TO or "random"
      channel = robot.adapter.client.rtm.dataStore.getChannelByName(to)
    else
      args.shift()
    text = args.join(" ")
    robot.messageRoom channel.id, text
    res.send """@#{from} send "#{text}" to ##{channel.name}"""
