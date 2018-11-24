xPopup = {};
xPopup.create = function(opt) {
	opt = $.extend({
		"message": "未知错误",
		"yes": {
			"name": "确认",
			"callback": function() {}
		},
		"no": {
			"name": "取消",
			"callback": function() {}
		}
	}, opt);
	
	var self = $('<div>');
	self.append([
		'<div class="x-overlay"></div>',
		'<div class="x-window">',
		'<div class="x-title"><a href="javascript:void(0)" class="x-close" title="关闭"></a></div>',
		'<div class="x-inner">',
		'<div class="x-inner-p">',
		'<p>'+ opt.message +'</p>',
		'<div class="x-line"></div>',
		'<div class="x-buttons">',
		'<a href="javascript:void(0)" class="x-btn" style="padding:0 10px;">'+ opt.yes.name +'</a>',
		'<a href="javascript:void(0)" class="x-btn x-none" style="padding:0 10px;">'+ opt.no.name +'</a>',
		'</div>',
		'</div>',
		'</div>',
		'</div>'
	].join(''));
	
	$('.x-close', self).bind('click', function() {
		$(this).closest('.x-window').parent().remove();
	});
	$('.x-buttons a', self).eq(0).bind('click', function() {
		if ($(this).attr('disabled')) {
			return false;
		}
		$(this).attr('disabled', true);
		opt.yes.callback.call();
		$('.x-close', self).trigger('click');
	}).end().eq(1).bind('click', function() {
		if ($(this).attr('disabled')) {
			return false;
		}
		$(this).attr('disabled', true);
		opt.no.callback.call();
		$('.x-close', self).trigger('click');
	});
	self.appendTo(document.body);
	opt.target = self;
	return opt;
};
