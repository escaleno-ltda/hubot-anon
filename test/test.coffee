Helper = require("hubot-test-helper")
expect = require("chai").expect

helper = new Helper("../src/index.coffee")

describe "hubot-anon", ->
  beforeEach ->
    @room = helper.createRoom({name: "user", httpd: false})

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

  context "replace default channel", ->
    beforeEach (done) ->
      process.env.HUBOT_ANON_TO = "#general"
      @room.user.say("user", "hubot anon hello world")
      setTimeout(done, 100)

    it "should get a message in #general", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon hello world"]
        ["hubot", "hello world"]
        ["hubot", """@user send "hello world" to #general"""]
      ])
