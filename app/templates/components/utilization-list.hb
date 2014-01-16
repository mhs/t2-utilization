<div class="staffList">
  <div class="number-container">
    <span class="numbers">{{property.length}}</span>
  </div>
{{title}}
</div>

<ul>
  {{#each property}}
  <li>{{name}}
        <div class="percent-bar">
          <div class="percentage">{{percentage}}%</div>
          <div class="indicator"></div>
        </div>
    </li>
  {{/each}}
</ul>
