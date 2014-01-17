{{#with this as container}}
  <div class="staffList">
    <div class="number-container">
      <span class="numbers">{{property.length}}</span>
    </div>
  {{title}}
  </div>
  <ul>
    {{#each person in list}}
      <li>{{person.name}}
      {{#if container.showPercentages}}
        <div class="percent-bar">
          <div class="percentage">{{person.percentage}}%</div>
          <div class="indicator" {{bind-attr style="person.width"}} ></div>
        </div>
      {{/if}}
      </li>
    {{/each}}
  </ul>
{{/with}}
