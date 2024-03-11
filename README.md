## Modular Account Plugin

This is a very basic example of an ERC6900 compatible plugin called CounterPlugin, built in Foundry. It has one function that can be called through a user operation, called `increment`. In `/src` you will find this plugin, documented so you can understand how it works in detail.

You will also find a basic test in `/test` which will show this counter plugin working. Here you'll see how to setup the modular account, install the plugins and send a user operation specifying the intent to increment the count. Use `forge test` to run these tests.

Feel free to modify the plugin and tests to challenge your understanding of ERC6900 plugins, or use this to start building your own plugin!

## Foundry Documentation

https://book.getfoundry.sh/
