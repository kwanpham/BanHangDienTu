/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';

    config.enterMode = CKEDITOR.ENTER_BR;
    config.toolbar = 'Full';
    config.filebrowserBrowseUrl = '/cms/ckplugin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/cms/ckplugin/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '/cms/ckplugin/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '/cms/ckplugin/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/cms/ckplugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/cms/ckplugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    
};
