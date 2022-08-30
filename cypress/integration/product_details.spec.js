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
  it('should go to the product detauls page of the first item', () => {
    cy.get('.products article').first().click();
    cy.get('.product-detail').should('be.visible');
    cy.get('.product-detail h1').should('have.text', 'Scented Blade');
  });
});
