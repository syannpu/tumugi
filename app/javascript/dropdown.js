document.addEventListener('turbo:load', function() {
  const triggers = document.querySelectorAll('[id$="-dropdown-trigger"]');
  
  triggers.forEach(function(trigger) {
    trigger.addEventListener('click', function(event) {
      event.preventDefault();
      
      const triggerId = trigger.id.replace('-dropdown-trigger', '');
      const menu = document.getElementById(triggerId + '-dropdown-menu');
      
      if (menu) {
        menu.classList.toggle('hidden');
      }
    });
  });
});
