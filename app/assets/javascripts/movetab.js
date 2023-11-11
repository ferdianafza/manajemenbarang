$(document).ready(function () {
   $('#barangTabs a').on('click', function (e) {
     e.preventDefault();
     var tabId = $(this).attr('href');
     showTab(tabId);
   });

   function showTab(tabId) {
     $('.tab-pane').removeClass('show active');
     $(tabId).addClass('show active');
   }
 });
