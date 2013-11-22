<div id="content">
  <header>
      <section class="nav-bar">
        {{view App.SelectOffice contentBinding="offices"
                                optionLabelPath="content.name"
                                optionValuePath="content"
                                selectionBinding="model"
                                data-test="offices"
                                class="white-button office-select"}}
        {{view App.NavView}}
      </section>
  </header>
  {{outlet}}
</div>
