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
  it('There should be products on the page', () => {
    cy.get('.products article').should('have.length', 2);
  });
});
