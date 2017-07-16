// Provide a default path to dwr.engine
if (typeof this['dwr'] == 'undefined') this.dwr = {};
if (typeof dwr['engine'] == 'undefined') dwr.engine = {};
if (typeof dwr.engine['_mappedClasses'] == 'undefined') dwr.engine._mappedClasses = {};

if (window['dojo']) dojo.provide('dwr.interface.dyTable');

if (typeof this['dyTable'] == 'undefined') dyTable = {};

dyTable._path = '/preprint/dwr';

/**
 * @param {function|Object} callback callback function or options object
 */
dyTable.getTables = function(callback) {
  return dwr.engine._execute(dyTable._path, 'dyTable', 'getTables', arguments);
};

/**
 * @param {interface java.util.Map} p0 a param
 * @param {function|Object} callback callback function or options object
 */
dyTable.setTables = function(p0, callback) {
  return dwr.engine._execute(dyTable._path, 'dyTable', 'setTables', arguments);
};

/**
 * @param {class java.lang.String} p0 a param
 * @param {interface java.util.Map} p1 a param
 * @param {interface java.util.Map} p2 a param
 * @param {interface java.util.Map} p3 a param
 * @param {function|Object} callback callback function or options object
 */
dyTable.getList = function(p0, p1, p2, p3, callback) {
  return dwr.engine._execute(dyTable._path, 'dyTable', 'getList', arguments);
};


