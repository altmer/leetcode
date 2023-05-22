/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */

class Crossword {
  constructor(board) {
    this.board = board;
  }

  search(word) {
    this.visited = new Array(this.board.length);
    for (let i = 0; i < this.visited.length; i++) {
      this.visited[i] = new Array(this.board[i].length);
    }
    for (let i = 0; i < this.visited.length; i++) {
      for (let j = 0; j < this.visited[i].length; j++) {
        if (this.board[i][j] != word.charAt(0)) {
          continue;
        }

        if (this.dfs(i, j, word.substring(1))) {
          return true;
        }
      }
    }
    return false;
  }

  dfs(x, y, word) {
    if (word == '') {
      return true;
    }
    this.visited[x][y] = true;
    for (let dx = -1; dx <= 1; dx++) {
      for (let dy = -1; dy <= 1; dy++) {
        if (Math.abs(dx) == Math.abs(dy)) {
          continue;
        }
        let nextX = x + dx;
        let nextY = y + dy;

        if (
          nextX < 0 ||
          nextY < 0 ||
          nextX >= this.board.length ||
          nextY >= this.board[x].length
        ) {
          continue;
        }
        if (this.visited[nextX][nextY]) {
          continue;
        }
        if (this.board[nextX][nextY] != word.charAt(0)) {
          continue;
        }
        if (this.dfs(nextX, nextY, word.substring(1))) {
          return true;
        }
      }
    }
    this.visited[x][y] = false;
    return false;
  }
}

let exist = function (board, word) {
  let crossword = new Crossword(board);
  return crossword.search(word);
};

module.exports = exist;
