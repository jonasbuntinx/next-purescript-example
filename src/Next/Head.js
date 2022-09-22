import * as React from "react";
import { default as head } from "next/head";

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

export function _head(props) {
  const children = React.Children.toArray(props.children)
    .reduce(onlyReactElement, [])
    .map(child => {
      if(typeof child.type === 'object' && child.type.render) {
        return child.type.render(Object.assign({ key: child.key }, child.props), child.ref)
      }
      else { return child }
    })
  return head({children })
}
