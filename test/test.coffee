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

    it "should get a message in #general", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon hello world"]
        ["hubot", "hello world"]
        ["hubot", """anonymous message to #general: hello world"""]
      ])

  context "valid channel", ->
    beforeEach (done) ->
      @room.user.say("user", "hubot anon #random hello world")
      setTimeout(done, 100)

    it "should get a message in #random", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon #random hello world"]
        ["hubot", "hello world"]
        ["hubot", """anonymous message to #random: hello world"""]
      ])

  context "replace default channel", ->
    beforeEach (done) ->
      process.env.HUBOT_ANON_TO = "#default"
      @room.user.say("user", "hubot anon hello world")
      setTimeout(done, 100)

    it "should get a message in #default", ->
      expect(@room.messages).to.eql([
        ["user", "hubot anon hello world"]
        ["hubot", "hello world"]
        ["hubot", """anonymous message to #default: hello world"""]
      ])
