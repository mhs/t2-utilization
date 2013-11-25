<div id="content">
  <header>
      <section class="nav-bar">
        {{view App.SelectOffice content=offices
                                optionLabelPath="content.name"
                                optionValuePath="content.id"
                                selection=selectedOffice
                                data-test="offices"
                                class="white-button office-select"}}
        {{view App.NavView}}
      </section>
  </header>
  {{outlet utilizationChart}}
  <div class="container">
    <div class="office-header">
      <h1>{{name}}</h1>
    </div>
    <section id="calendarBar">
      <div class="calendar-date-selector">
        <i {{action 'decrementDate'}} class="date-jump">&#58541;</i>
        {{edit-date class="datepicker" action="confirmDate" value=formattedSnapDate escape-press="confirmDate"}}
        <i {{action 'incrementDate'}} class="date-jump">&#58542;</i>
      </div>
    </section>
    <div class="staff-lists">
    {{outlet snapshot}}
      <div class="office-by-office">
        {{outlet officeByOffice}}
      </div>
    </div>
  </div>
</div>


