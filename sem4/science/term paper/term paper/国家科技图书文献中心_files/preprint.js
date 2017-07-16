// Provide a default path to dwr.engine
if (typeof this['dwr'] == 'undefined') this.dwr = {};
if (typeof dwr['engine'] == 'undefined') dwr.engine = {};
if (typeof dwr.engine['_mappedClasses'] == 'undefined') dwr.engine._mappedClasses = {};

if (window['dojo']) dojo.provide('dwr.interface.preprint');

if (typeof this['preprint'] == 'undefined') preprint = {};

preprint._path = '/preprint/dwr';

/**
 * @param {function|Object} callback callback function or options object
 */
preprint.getTypeProxy = function(callback) {
  return dwr.engine._execute(preprint._path, 'preprint', 'getTypeProxy', arguments);
};

/**
 * @param {class org.springfire.core.dao.DaoProxyByType} p0 a param
 * @param {function|Object} callback callback function or options object
 */
preprint.setTypeProxy = function(p0, callback) {
  return dwr.engine._execute(preprint._path, 'preprint', 'setTypeProxy', arguments);
};

/**
 * @param {interface java.util.Map} p0 a param
 * @param {function|Object} callback callback function or options object
 */
preprint.login = function(p0, callback) {
  return dwr.engine._execute(preprint._path, 'preprint', 'login', arguments);
};

/**
 * @param {class java.lang.String} p0 a param
 * @param {function|Object} callback callback function or options object
 */
preprint.subClass = function(p0, callback) {
  return dwr.engine._execute(preprint._path, 'preprint', 'subClass', arguments);
};


