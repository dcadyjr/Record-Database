import { RecorddbPage } from './app.po';

describe('recorddb App', () => {
  let page: RecorddbPage;

  beforeEach(() => {
    page = new RecorddbPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
