/* http://keith-wood.name/countdown.html
   Persian (فارسی) initialisation for the jQuery countdown extension
   Written by Alireza Ziaie (ziai@magfa.com) Oct 2008. */
(function($) {
	$.countdown.regional['vn'] = {
		labels: ['Năm','Tháng','Tuần','Ngày','Giờ','Phút','Giây'],
		labels1: ['Năm','Tháng','Tuần','Ngày','Giờ','Phút','Giây'],
		compactLabels: ['năm','tháng','tuần','ngày'],
		whichLabels: null,
		timeSeparator: ':', isRTL: true};
	$.countdown.setDefaults($.countdown.regional['vn']);
})(jQuery);
