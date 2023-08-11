beforeEach(() => {

  cy.visit('/');
});

// describe(" Login Test Cases", () => {

//Successfull test cases

// it("Can login and logout with valid user email and password", () => {
//   //CHECK LOGIN
//   //get login button and click on it. will redirect to /login page
//   cy.get(".nav-link")
//   cy.contains("Login")
//   .click();

//   // Locate the email input field by its id attribute
//   cy.get("#email").type("test@example.com")
//   .get("#password").type("password")
//   .get('input[name="commit"]')
//   .click()

//   cy.log("After login");
//   cy.url().should("include", "/");

//   // Chain assertions to ensure that the login action is completed
//   cy.contains("Bob").should("be.visible");

//   //CHECK LOGOUT
//   // Click on the user's name to trigger the dropdown menu
//   cy.get("#navbarDropdownUser").click();
//   // Click the "Logout" button
//   cy.contains("Logout").click();

//   // Assert redirection to the login page after logout
//   cy.url().should("include", "/login");
// });

//Negative test cases

// it("Displays error message for incorrect password", () => {
//   cy.visit("/login");

//   cy.get("#email").type("test@example.com");
//   cy.get("#password").type("incorrect_password");
//   cy.get('input[name="commit"]').click();

//   // Assert that an error message is displayed
//   cy.contains("Invalid email or password").should("be.visible");
// });

// it("Displays error message for non-existent user", () => {
//   cy.visit("/login");

//   cy.get("#email").type("nonexistent@example.com");
//   cy.get("#password").type("password");
//   cy.get('input[name="commit"]').click();

//   // Assert that an error message is displayed
//   cy.contains("Invalid email or password").should("be.visible");
// });

// });

describe(" Signup Test Cases", () => {

  // Clean up the test user
  //this is coming from suppor/commands.js custom command
  afterEach(() => {
    cy.cleanupTestUser();
  });


  it("Successfully creates a new user", () => {
    // Navigate to the signup page
    cy.get(".nav-link")
      .contains("Signup")
      .click();

    // Fill in user details
    cy.get("#user_first_name").type("Ana");
    cy.get("#user_last_name").type("Smith");
    cy.get("#user_email").type("ana@smith2020.com");
    cy.get("#user_password").type("password");
    cy.get("#user_password_confirmation").type("password");
    cy.get('input[name="commit"]').click();

    // Assert that the user is redirected to the home page after successful signup
    cy.url().should("include", "/");

    // Assert that the user's name is visible on the page
    cy.contains("Ana").should("be.visible");


  });

});