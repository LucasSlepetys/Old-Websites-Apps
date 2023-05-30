'use strict';

//! Event listeners:
const answersClassElement = document.getElementsByClassName('answer');

//! elements from HTML:
const questionTitleElement = document.getElementById('question');
const progressElement = document.getElementById('progress');

//! buttons from HTML:
const startButton = document.getElementById('start-btn');
const previousQuestionButton = document.getElementById('back-btn');
const nextQuestionButton = document.getElementById('next-btn');

//! hiden elements:
const questionsHide = document.getElementById('questions-hide');
const footerHide = document.getElementById('footer-hide');
const answersControl = document.getElementById('answers-control');

//! Variables:
const questionAnswer = [];

//! -------- Start retrive question list from local json file --------
fetch('newQuestions.json')
  .then((response) => response.json())
  .then((data) => {
    questionsList = data;

    //! Creates dictionary with Question index and selected answer:
    questionsList.forEach((question) => {
      questionAnswer.push({
        question: question['question'],
        questionIndex: question['questionIndex'],
        selectedAnswer: undefined,
      });
    });
  })
  .catch((error) => console.log('Error: ' + error));
//! -------- Finish retriving question list --------

//! -------- Inicializing variables --------
let randomQuestionsList, questionsList;
let index = 0;

//! -------- Wait until start button is clicked, then calls fuction to start quiz --------
startButton.addEventListener('click', () => {
  console.log('start');
  startQuiz();
});

function startQuiz() {
  //! hide & show elements:
  startButton.classList.add('hide');
  questionsHide.classList.remove('hide');
  footerHide.classList.remove('hide');

  //! sorts questionList into a new array with random indexes
  randomQuestionsList = questionsList.sort(() => Math.random() - 0.5);
  // questionAnswer.forEach((question) => {
  //   console.log(question);
  // });

  //! Calls function to set next question:
  setNextQuestion();
}

function setNextQuestion() {
  //* Each quiz should have maximum 10 question
  //* if the index if less than 10, if nextQuestion button is clicked then progressElemet should update question by one
  //* if it is the last question then message should change from "Next question" to "Finish Survery".
  //* Then either way it should always reset the state to clear all questions from the screen and then it should showNextQuestion
  if (index < 10) {
    progressElement.innerText = `Question ${index + 1} / 10`;
    nextQuestionButton.innerText = 'Next Question';
    if (index === 9) {
      nextQuestionButton.innerText = 'Finish Survey';
    }
    resetState();
    showNextQuestion();
  }
  //* if last question has been reached:
  else {
    //* decrease the index by one since it automatically increases it to 10 (list goes until 9)
    index--;
    //* checks if every questions contains an answer, if it does do that:
    if (checkForUnderfined()) {
      increaseAmountOfTimesSelected();
    }
    //* if not all questions contain an answer alert this:
    else {
      Swal.fire({
        icon: 'error',
        title: 'Please select an answer for each question!',
        text: 'Not all questions has been selected...',
      });
    }
  }
}

//* function to check if all questions contain an answer (At least one has been selected for each question)
function checkForUnderfined() {
  let toReturn = true;
  questionAnswer.forEach((answer) => {
    if (answer['selectedAnswer'] === undefined) {
      toReturn = false;
    }
  });
  return toReturn;
}

//* function to clear the screen in order to show next question
function resetState() {
  while (answersControl.firstChild) {
    answersControl.removeChild(answersControl.firstChild);
  }
}

//* function to show the next question in the array (uses the index incrementation in order to show the right question element)
function showNextQuestion() {
  questionTitleElement.innerText = randomQuestionsList[index].question;
  console.log(randomQuestionsList[index]);
  console.log(questionAnswer[index]);
  let count = 0;
  randomQuestionsList[index].answers.forEach((answer) => {
    let element = document.createElement('div');
    element.innerText = answer['answer'];
    element.classList.add('answer');
    element.addEventListener('click', selectedAnswer);

    questionAnswer.forEach((answer) => {
      if (
        answer['questionIndex'] === randomQuestionsList[index]['questionIndex']
      ) {
        if (answer['selectedAnswer'] !== undefined) {
          console.log(`Selected answer was ${answer['selectedAnswer']}`);
          if (count == answer['selectedAnswer']) {
            element.classList.add('answer-selected');
          }
        }
      }
    });
    count++;
    answersControl.appendChild(element);
  });
}

function selectedAnswer(e) {
  let el = e.target;

  resetStyle(e.target);
  e.target.classList.add('answer-selected');

  setSelectedIndex(el);
  e.target.dataset.selected = true;
  // console.log(e.target.dataset.selected);
  // console.log(e.target, e);
  // console.log(randomQuestionsList[index]);
  // console.log(randomQuestionsList[index]['questionIndex']);
}

function resetStyle(e) {
  [...answersControl.children].forEach((div) => {
    div.classList.remove('answer-selected');
  });
}

function setSelectedIndex(el) {
  questionAnswer.forEach((answer) => {
    // console.log(answer);
    if (answer['question'] === randomQuestionsList[index]['question']) {
      // console.log(answer);
      // console.log(randomQuestionsList[index]);

      // Loop though answers and check if answer is the same as el.innerText
      // console.log(el.innerText);
      let questionindex = 0;
      randomQuestionsList[index]['answers'].forEach((ans) => {
        // console.log(ans);
        if (el.innerText === ans['answer']) {
          // If it is get the index of that question
          // Set the index to selectedIndex in questionAnswer with the same questionIndex
          // console.log('Selected Answer is ' + questionindex);
          // console.log(questionAnswer);
          answer['selectedAnswer'] = questionindex;
          // console.log(answer['selectedIndex']);
        }
        questionindex++;
      });

      // console.log(questionAnswer);
    }
  });
}

nextQuestionButton.addEventListener('click', () => {
  index++;
  setNextQuestion();

  //! Check todo below below before doing this
  //* 1) if (index == lastOne).then (done)
  //* 2) check if all answers on questionAnswer has a selectedAnswer / if it's not underfined (done)
  //* 3) send a error message if not all of them has a selectedAnswer index (done)
  //! if all have it then add an extra value on the question -> answer -> answer with selectedAnswer index E.G:
  // "answers": [
  //   {
  //     "answer" = "Go to school",
  //     "amountOfTimesPicked" = 1
  //   },
  //   {
  //     "answer" = "Work in an office",
  //     "amountOfTimesPicked" = 0
  //   }
  // ]

  //! Task 1, 2 and 3 can be done before doing the rest on this list (done):
  //! before doing anything, go back to questions.json file and change all answers to have a amountOfTimesPicked (dictionary) (done!)
  //! Then go back to code here and change all loops to be able to work with that type of data instructure (done)
  //! then work on this functionality above ;)
});

previousQuestionButton.addEventListener('click', () => {
  if (index > 0) {
    index--;
    setNextQuestion();
  }
});

function increaseAmountOfTimesSelected() {
  questionAnswer.forEach((answerQuestion) => {
    questionsList.forEach((answerList) => {
      if (answerQuestion['questionIndex'] === answerList['questionIndex']) {
        console.log(answerQuestion['selectedAnswer']);
        console.log(answerList['question']);
        console.log('--------------');
        let index = 0;
        answerList['answers'].forEach((ans) => {
          if (index === answerQuestion['selectedAnswer']) {
            ans['amountOfTimesSelected'] = ans['amountOfTimesSelected'] + 1;
            console.log('Done!');
          }
          index++;
        });
      }
    });
  });
  console.log(questionsList);
}
