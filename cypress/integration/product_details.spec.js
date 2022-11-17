describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("One product's detail page can be navigated to", () => {
    cy.get('[data-test-id="product"]')
      .should("have.attr", "data-test-id", "product")
      .contains("Giant Tea")
      .click();
  });
});
