# hubot-anon

[![npm version](https://img.shields.io/npm/v/hubot-anon.svg?style=flat-square)](https://www.npmjs.com/package/hubot-anon)
[![npm downloads](https://img.shields.io/npm/dm/hubot-anon.svg?style=flat-square)](https://www.npmjs.com/package/hubot-anon)
[![Build Status](https://img.shields.io/travis/lgaticaq/hubot-anon.svg?style=flat-square)](https://travis-ci.org/lgaticaq/hubot-anon)
[![Coverage Status](https://img.shields.io/coveralls/lgaticaq/hubot-anon/master.svg?style=flat-square)](https://coveralls.io/github/lgaticaq/hubot-anon?branch=master)
[![Code Climate](https://img.shields.io/codeclimate/github/lgaticaq/hubot-anon.svg?style=flat-square)](https://codeclimate.com/github/lgaticaq/hubot-anon)
[![dependency Status](https://img.shields.io/david/lgaticaq/hubot-anon.svg?style=flat-square)](https://david-dm.org/lgaticaq/hubot-anon#info=dependencies)
[![devDependency Status](https://img.shields.io/david/dev/lgaticaq/hubot-anon.svg?style=flat-square)](https://david-dm.org/lgaticaq/hubot-anon#info=devDependencies)

> A Hubot script to send anonymous messages

## Installation
```bash
npm i -S hubot-anon
```

Optional set environment variable *HUBOT_ANON_TO* to replace default channel (#general).

add `["hubot-anon"]` to `external-scripts.json`.

## Examples

`hubot anon <message>` -> `Send message to the default channel`

`hubot anon <#channel> <message>` -> `Send message to #channel`

## License

[MIT](https://tldrlegal.com/license/mit-license)
