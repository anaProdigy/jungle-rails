beforeEach(() => {

  cy.visit('/');
});

describe("Negative Login Test Cases", () => {
it("Can login and logout with valid user email and password", () => {
  //CHECK LOGIN
  //get login button and click on it. will redirect to /login page
  cy.get(".nav-link")
  cy.contains("Login")
  .click();

  // Locate the email input field by its id attribute
  cy.get("#email").type("test@example.com")
  .get("#password").type("password")
  .get('input[name="commit"]')
  .click()

  cy.log("After login");
  cy.url().should("include", "/");

  // Chain assertions to ensure that the login action is completed
  cy.contains("Bob").should("be.visible");

  //CHECK LOGOUT
  // Click on the user's name to trigger the dropdown menu
  cy.get("#navbarDropdownUser").click();
  // Click the "Logout" button
  cy.contains("Logout").click();

  // Assert redirection to the login page after logout
  cy.url().should("include", "/login");
});

it("Displays error message for incorrect password", () => {
  cy.visit("/login");

  cy.get("#email").type("test@example.com");
  cy.get("#password").type("incorrect_password");
  cy.get('input[name="commit"]').click();

  // Assert that an error message is displayed
  cy.contains("Invalid email or password").should("be.visible");
});

it("Displays error message for non-existent user", () => {
  cy.visit("/login");

  cy.get("#email").type("nonexistent@example.com");
  cy.get("#password").type("password");
  cy.get('input[name="commit"]').click();

  // Assert that an error message is displayed
  cy.contains("Invalid email or password").should("be.visible");
});

});