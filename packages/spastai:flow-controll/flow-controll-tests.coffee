if (Meteor.isClient)
  testAsyncMulti "ParallelQueue - Context", [

    (test, expect) ->
      m = @mark = new Date();
      console.log({mark:@mark});
      after = new ParallelQueue(@);
      wrappedMethod = after.wrap expect ()=>
        console.log({afterWrap:@mark})
        test.equal(m,@mark,"Wrapped method should get outter context");
      wrappedMethod();
      after.start();

  ]
