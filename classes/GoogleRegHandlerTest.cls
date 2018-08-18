@isTest
public with sharing class GoogleRegHandlerTest {
    
  @isTest
  public static void createUserPositiveTest() {
        
    User u1 = [Select Id, Username from User Where isActive = true Limit 1];

    Auth.UserData sampleData = new Auth.UserData('testId', 'testFirst', 'testLast',
        'testFirst testLast', u1.Username, null, 'testuserlong', 'en_US', 'facebook',
        null, new Map<String, String>{'language' => 'en_US'});

    GoogleRegHandler handler = new GoogleRegHandler();

    User u2 = handler.createUser(null, sampleData);

    System.assertEquals(u1.Id, u2.Id);

    }

  @isTest
  public static void createUserNegativeTest() {
    
    Auth.UserData sampleData = new Auth.UserData('testId', 'testFirst', 'testLast',
        'testFirst testLast', 'regohandler@test.org', null, 'testuserlong', 'en_US', 'facebook',
        null, new Map<String, String>{'language' => 'en_US'});

    GoogleRegHandler handler = new GoogleRegHandler();

    User u2 = handler.createUser(null, sampleData);

    System.assertEquals(null, u2);

  }

  @isTest
  public static void updateUserTest() {

    Auth.UserData sampleData = new Auth.UserData('testId', 'testFirst', 'testLast',
        'testFirst testLast', 'testuser@example.org', null, 'testuserlong', 'en_US', 'facebook',
        null, new Map<String, String>{'language' => 'en_US'});

    GoogleRegHandler handler = new GoogleRegHandler();
    
    handler.updateUser(null, null, sampleData);

  }
}