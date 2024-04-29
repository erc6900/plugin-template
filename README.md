## ERC-6900 Account Plugin

This is a basic example of an ERC-6900 compatible plugin called CounterPlugin, built in Foundry. It has one function that can be called through a user operation, called `increment`. In `/src` you will find this plugin, documented so you can understand how it works in detail.

You will also find a basic test in `/test` which will show this counter plugin working. Here you'll see how to setup the modular account, install the plugins and send a user operation specifying the intent to increment the count. Use `forge test` to run these tests.

Also included is a helper contract for tests call `AccountTestBase`, which handles the process of setting up the EntryPoint and a testing account. If you're writing your own tests for a custom plugin, you can use this test base to simplify the setup.

Feel free to modify the plugin and tests to challenge your understanding of ERC-6900 plugins, or use this to start building your own plugin! Click "Use this template" above to create your own plugin.

## Foundry Documentation

https://book.getfoundry.sh/
