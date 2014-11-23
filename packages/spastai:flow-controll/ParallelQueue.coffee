#Is counting how many actions are running at same time
class ParallelQueue
  active = 0
  @finalCallback
  actions = []

  constructor: (context) ->
    @context

  executeNow = (fn) ->
    fn()
    return


  run: (fn) ->
    actions.push fn

  start: ->
    @run = executeNow
    for i of actions
      actions[i]()

  wrap: (fn) ->
    self = @
    args = undefined
    return ()->
      active++

      args = [].slice.call(arguments)
      callback = args.pop()
      if callback and (typeof callback isnt "function")
        # it's just an argument
        args.push callback
        callback = `undefined`
      args.push ->
        callback and callback.apply(this, [].slice.call(arguments))
        self.finalCallback and self.finalCallback()  if --active is 0
      # call provided fn with @ context to allow wrap be used in declarations
      self.run fn.bind.apply(fn, [@].concat(args))

  @purge = (fn) ->
    @finalCallback = fn
    @start()
