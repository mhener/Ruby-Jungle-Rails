describe('Homepage', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('should go to the homepage', () => {
    cy.visit('/');
    cy.title().should('include', 'Jungle');
  });
  it('should show products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
  it("should click the 'Add' button on one product from the homepage", () => {
    cy.get('button').contains('Add').click({ force: true });
  });

  it("should increase the cart count by 1 when 'Add' button is pressed", () => {
    cy.get('button').contains(' Add ').click({ force: true });
    cy.get('a').contains(' My Cart (1) ').should('be.visible');
  });
});
