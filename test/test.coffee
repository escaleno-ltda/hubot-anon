Helper = require("hubot-test-helper")
expect = require("chai").expect

helper = new Helper("./../src/index.coffee")

describe "hubot-anon", ->
  beforeEach ->
    @room = helper.createRoom({name: "user"})
    @room.robot.adapter.client =
      rtm:
        dataStore:
          getChannelByName: (to) ->
            channels =
              random: {id: "R00000001", name: "random"}
              "#general": {id: "G00000001", name: "general"}
              general: {id: "G00000001", name: "general"}
            return channels[to]

  afterEach ->
    @room.destroy()

  context "default channel", ->
    beforeEach (done) ->
      @room.user.say("user", "hubot anon hello world")
      setTimeout(done, 100)

    it "should get a message in #random", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon hello world"]
        ["hubot", "hello world"]
        ["hubot", """@user send "hello world" to #random"""]
      ])

  context "valid channel", ->
    beforeEach (done) ->
      @room.user.say("user", "hubot anon #general hello world")
      setTimeout(done, 100)

    it "should get a message in #general", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon #general hello world"]
        ["hubot", "hello world"]
        ["hubot", """@user send "hello world" to #general"""]
      ])

  context "invalid channel", ->
    beforeEach (done) ->
      @room.user.say("user", "hubot anon #invalid hello world")
      setTimeout(done, 100)

    it "should get a message in #random", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon #invalid hello world"]
        ["hubot", "#invalid hello world"]
        ["hubot", """@user send "#invalid hello world" to #random"""]
      ])

  context "replace default channel", ->
    beforeEach (done) ->
      process.env.HUBOT_ANON_TO = "general"
      @room.user.say("user", "hubot anon hello world")
      setTimeout(done, 100)

    it "should get a message in #general", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon hello world"]
        ["hubot", "hello world"]
        ["hubot", """@user send "hello world" to #general"""]
      ])
