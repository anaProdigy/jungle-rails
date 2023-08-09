beforeEach(() => {

  cy.visit('/');
}); 

it("Clicks on a product link", () => {

  // Find the first product's article and click it
  cy.get(".products article")
  .first()
  .click();

// Assert that the URL has changed to the expected product detail page
  cy.url().should("include", "/products/2");
 

});