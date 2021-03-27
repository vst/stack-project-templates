# Stack New Project Template

> *works-for-me*

## Usage

There are 3 templates:

1. [apponly](./apponly.hsfiles)
1. [bare](./bare.hsfiles)
1. [cli-program](./cli-program.hsfiles)

You can use any to bootstrap a project:

```
stack new <NAME> vst/<TEMPLATE>
```

For example, you can create a new project `my-project`:

```
stack new my-project vst/apponly
```

... and then, use `stack` to continue with development:

```
cd my-project
stack run
stack test
```

... or, use `cabal` to continue with development:

```
cd my-project
cabal run my-project
cabal test
```

## Rebuilding Templates

Some templates have dedicated directories for individual parts. You
can compile them into a single `.hsfiles` file by running
`./create-hsfiles.sh` script. For example:

```
./create-hsfiles.sh apponly > apponly.hsfiles
```
