const filterBox = document.querySelectorAll('.book');

document.querySelector('nav').addEventListener('click', event=>{
if(event.target.tagName !== 'LI') return false;

let filterClass = event.target.dataset['f'];


filterBox.forEach(elem => {
    elem.classList.remove('hide');
    if(!elem.classList.contains(filterClass) && filterClass !== "all"){
        elem.classList.add('hide');
    }
});
});

document.querySelector('#search').oninput= function(){
    let val = this.value.trim();
 
    if(val != ''){
        filterBox.forEach(elem => {
            if(elem.innerText.search(val) == -1){
                elem.classList.add('hide');
               
            }
            else{
                elem.classList.remove('hide');


               
               
            }
        });
    }
    else{
                filterBox.forEach(elem =>{
                        elem.classList.remove('hide');
                     
                });
    }
}

function insertMark (book, pos, author){
  book.slice(0, pos) + '<mark>' + book.slice(pos,pos + author) + '</mark>' + book.slice(pos + author);
    console.log("book: ",book,"author: ", author)};