document.addEventListener('DOMContentLoaded', function() {
  // 全てのドロップダウントリガーを取得
  const triggers = document.querySelectorAll('[id$="-dropdown-trigger"]');
  
  triggers.forEach(function(trigger) {
    trigger.addEventListener('click', function(event) {
      event.preventDefault();
      
      // 対応するメニューを取得
      const triggerId = trigger.id.replace('-dropdown-trigger', '');
      const menu = document.getElementById(triggerId + '-dropdown-menu');
      
      if (menu) {
        menu.classList.toggle('hidden');
      }
    });
  });
});