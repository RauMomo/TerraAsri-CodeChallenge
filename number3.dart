//palindrome

isCircularPalindrome(String word) {
  var wordToTest = word;

  //false apabila panjang kata 1 atau kosong
  if (wordToTest.length <= 1) {
    return false;
  }

  //increment dari ujung kiri (i) lalu decrement dari ujung kanan (j)
  var j = word.length - 1;
  for (var i = 0; i < word.length / 2; i++) {
    //validasi apabila character tersebut sama
    if (word[i] != word[j]) {
      return false;
    }
    j--;
  }
  return true;
}

void main() {
  isCircularPalindrome('a');
  isCircularPalindrome('adda');
  isCircularPalindrome('racecar');
}
