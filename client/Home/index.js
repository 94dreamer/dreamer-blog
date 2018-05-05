import React from 'react';
import ReactDOM from 'react-dom';
import CssBaseline from 'material-ui/CssBaseline';
import Button from 'material-ui/Button';

import AccessAlarmIcon from '@material-ui/icons/AccessAlarm';

function App() {
    return (
        // React 中一个常见模式是为一个组件返回多个元素。
        // 片段(fragments) 可以让你将子元素列表添加到一个分组中，并且不会在DOM中增加额外节点。
        <React.Fragment>
            <CssBaseline />
            <Button variant="raised" color="primary">
      Hello World
            </Button>
            <AccessAlarmIcon />
        </React.Fragment>
    );
}

ReactDOM.render(<App />, document.querySelector('#app'));

