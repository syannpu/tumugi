function setupButtonScroll(btnSelector, targetSelector) {
  const button = document.querySelector(btnSelector);
  
  if (button) {
    button.addEventListener('click', function() {
      const element = document.querySelector(targetSelector);
      if (element) {
        const position = element.offsetTop;
        window.scrollTo({
          top: position,
          behavior: 'smooth' 
        });
      }
    });
  }
}


// 各ボタンとセクションを設定
setupButtonScroll('.btn-organizer', '#organizer-section');
setupButtonScroll('.btn-exhibitor', '#exhibitor-section');
setupButtonScroll('.btn-participant', '#participant-section');