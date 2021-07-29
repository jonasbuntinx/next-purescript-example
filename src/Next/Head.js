var React = require("react");
var head = require("next/head").default;

function onlyReactElement(list, child) {
  if (typeof child === 'string' || typeof child === 'number') {
    return list;
  }
  if (child.type === React.Fragment) {
    return list.concat(React.Children.toArray(child.props.children).reduce((fragmentList, fragmentChild) => {
      if (typeof fragmentChild === 'string' || typeof fragmentChild === 'number') {
        return fragmentList;
      }
      return fragmentList.concat(fragmentChild);
    }, []));
  }
  return list.concat(child);
}

exports._head = function(props) {
  var children = React.Children.toArray(props.children)
    .reduce(onlyReactElement, [])
    .map(child => {
      if(typeof child.type === 'object' && child.type.render) {
        return child.type.render(Object.assign({ key: child.key }, child.props), child.ref)
      }
      else { return child }
    })
  return head({children })
}
