## action-scf

This action helps you to deploy your functions to tencentcloud serverless easily

#### Usage

At first, you are necessary to learn something about tencentcloud serverless.
Here is the [document](https://cloud.tencent.com/document/product/583/9199?language=en).

Then, the action reles on SCF CLI.

The input of the action except args is the same as the params of scf configure, but you have to make the keys of params to small hump, eg: secret-id -> secretId.

You can learn more in this github, [scfcli](https://github.com/tencentyun/scfcli).

And the args is designed to the users to exec scf deploy more flexibility, eg:
if you want to deploy the functions , not deploy the triggers and use a cos bucket to deploy, you can input the args like that:

```bash
deploy --skip-event -c {{COS_BUCKET}}
```

Here is an executable example.

```yml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: actions/setup-node@v1
        with:
          node-version: "10.x"
      - name: npm install
        run: cd hello_world && npm install
      - name: deploy
        uses: Juliiii/action-scf@master
        with:
          appId: 1252618971
          region: ap-guangzhou
          usingCos: "true"
          secretId: ${{ secrets.TENCENTCLOUD_SECRET_ID }}
          secretKey: ${{ secrets.TENCENTCLOUD_SECRET_KEY }}
          args: deploy -t ./hello_world/template.yaml -f
```

#### License

This project is distributed under the MIT license.
