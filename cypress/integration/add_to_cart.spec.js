beforeEach(() => {

  cy.visit('/');
});

it("Click the 'Add to Cart' button for a product on the home page increases cart count by one", () => {

  // Find the first product's article and click it
  cy.get(".products article")
  cy.contains("My Cart (0)")
  cy.get(".btn")
    .first()
    .click({ force: true });
  // Assert that the URL has changed to the expected product detail page
  // Assert that the cart count has increased by one
  cy.contains("My Cart (1)")

});