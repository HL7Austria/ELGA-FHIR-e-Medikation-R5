// embed-giscus.js
/*
(function () {

    const script = document.createElement('script');
    script.src = 'https://giscus.app/client.js';
    script.type = 'text/javascript';
    script.setAttribute('data-repo', 'HL7Austria/ELGA-FHIR-e-Medikation-R5');
    script.setAttribute('data-repo-id', 'R_kgDOLhyFQQ');
    script.setAttribute('data-category', 'Comment');
    script.setAttribute('data-category-id', 'DIC_kwDOLhyFQc4Cev5-');
    script.setAttribute('data-mapping', 'url');
    script.setAttribute('data-reactions-enabled', '0');
    script.setAttribute('data-emit-metadata', '1');
    script.setAttribute('data-input-position', 'bottom');
    script.setAttribute('data-theme', 'light');
    script.setAttribute('data-lang', 'en');
    script.crossOrigin = 'anonymous';
    script.async = true;
  
    document.body.appendChild(script);

    console.log('[Giscus] embed script added');
  })();
  */

  document.addEventListener('DOMContentLoaded', () => {
  const headings = document.querySelectorAll('.split.left h3');
  const container = document.getElementById('giscus-thread-container');

  if (!headings.length || !container) return;

  headings.forEach((h3, index) => {
    const termText = h3.textContent.trim();
    const safeId = termText.replace(/\s+/g, '-').toLowerCase();

    // Create wrapper for each comment section
    const wrapper = document.createElement('div');
    wrapper.className = 'giscus-section';
    wrapper.style.marginBottom = '2em';

    // Toggle button
    const toggle = document.createElement('button');
    toggle.textContent = `💬 Comments for: ${termText}`;
    toggle.style.margin = '0.5em 0';
    toggle.style.display = 'block';
    toggle.style.background = '#f0f0f0';
    toggle.style.border = '1px solid #ccc';
    toggle.style.padding = '0.5em';
    toggle.style.cursor = 'pointer';

    // Hidden container for Giscus thread
    const commentBox = document.createElement('div');
    commentBox.id = `giscus-${safeId}`;
    commentBox.style.display = 'none';

    // Giscus widget script
    const giscusScript = document.createElement('script');
    giscusScript.src = 'https://giscus.app/client.js';
    giscusScript.type = 'text/javascript';
    giscusScript.setAttribute('data-repo', 'HL7Austria/ELGA-FHIR-e-Medikation-R5');
    giscusScript.setAttribute('data-repo-id', 'R_kgDOLhyFQQ');
    giscusScript.setAttribute('data-category', 'Comment');
    giscusScript.setAttribute('data-category-id', 'DIC_kwDOLhyFQc4Cev5-');
    giscusScript.setAttribute('data-mapping', 'specific');
    giscusScript.setAttribute('data-term', termText);
    giscusScript.setAttribute('data-theme', 'light');
    giscusScript.setAttribute('crossorigin', 'anonymous');
    giscusScript.async = true;

    // Toggle visibility
    toggle.onclick = () => {
      commentBox.style.display = commentBox.style.display === 'none' ? 'block' : 'none';
    };

    commentBox.appendChild(giscusScript);
    wrapper.appendChild(toggle);
    wrapper.appendChild(commentBox);
    container.appendChild(wrapper);
  });
});
