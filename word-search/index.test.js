let exist = require('./index');

test('returns true when word exists on a board', () => {
  const board = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E'],
  ];
  const word = 'ABCCED';
  expect(exist(board, word)).toBe(true);
});

test('returns false when word does not exist on a board', () => {
  const board = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E'],
  ];
  const word = 'ABCB';
  expect(exist(board, word)).toBe(false);
});

test('finds word anywhere on board', () => {
  const board = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E'],
  ];
  const word = 'SEE';
  expect(exist(board, word)).toBe(true);
});
