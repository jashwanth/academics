// Provide a default path to dwr.engine
if (typeof this['dwr'] == 'undefined') this.dwr = {};
if (typeof dwr['engine'] == 'undefined') dwr.engine = {};
if (typeof dwr.engine['_mappedClasses'] == 'undefined') dwr.engine._mappedClasses = {};

if (window['dojo']) dojo.provide('dwr.interface.dwrUtil');

if (typeof this['dwrUtil'] == 'undefined') dwrUtil = {};

dwrUtil._path = '/preprint/dwr';

/**
 * @param {function|Object} callback callback function or options object
 */
dwrUtil.getServerTime = function(callback) {
  return dwr.engine._execute(dwrUtil._path, 'dwrUtil', 'getServerTime', arguments);
};

/**
 * @param {class java.lang.String} p0 a param
 * @param {class java.lang.String} p1 a param
 * @param {interface java.util.Map} p2 a param
 * @param {interface java.util.Map} p3 a param
 * @param {function|Object} callback callback function or options object
 */
dwrUtil.buildTable = function(p0, p1, p2, p3, callback) {
  return dwr.engine._execute(dwrUtil._path, 'dwrUtil', 'buildTable', arguments);
};

/**
 * @param {interface java.util.Map} p0 a param
 * @param {function|Object} callback callback function or options object
 */
dwrUtil.map2js = function(p0, callback) {
  return dwr.engine._execute(dwrUtil._path, 'dwrUtil', 'map2js', arguments);
};

/**
 * @param {interface java.util.List} p0 a param
 * @param {function|Object} callback callback function or options object
 */
dwrUtil.list2Parameter = function(p0, callback) {
  return dwr.engine._execute(dwrUtil._path, 'dwrUtil', 'list2Parameter', arguments);
};


