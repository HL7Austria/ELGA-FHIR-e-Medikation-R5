  <div xmlns="http://www.w3.org/1999/xhtml" class="container"> 
   Zum besseren Verständnis des Implementierungsleitfaden „e-Medikation“ werden im Folgenden die Anwendungsfälle kurz dargestellt.
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#allgemein">Allgemein</a></li>
        <li><a data-toggle="tab" href="#pres_create">Verordnung(en) mit Rezept anlegen</a></li>
        <li><a data-toggle="tab" href="#pres_read">Rezept mit Verordnung(en) abrufen</a></li>
    </ul>
    <div class="tab-content">
        <div id="allgemein" class="tab-pane fade in active">
            {% include usecase_1_general_de.md %}
        </div>
        <div id="pres_create" class="tab-pane fade">
            {% include usecase_2_pres_create_de.md %}
        </div>
        <div id="pres_read" class="tab-pane fade">
            {% include usecase_3_pres_read_de.md %}
        </div>
    </div>
</div>