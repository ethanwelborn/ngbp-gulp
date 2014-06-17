describe 'ngbp-gulp', ->

  beforeEach module 'ngbp-gulp'

  describe 'home module', ->

    scope = null
 
    beforeEach inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      $controller 'home_controller',
        $scope : scope
      return


    it 'should have a scope', ->
      expect(scope).toBeDefined()
      return

    it 'should contain 3 great things', ->
      expect(scope.great_things).toBeDefined()
      expect(scope.great_things.length).toEqual(3)
      return

    return

  return
