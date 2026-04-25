/* Visit-counter footer addon for the portfolio site.
   Mirrors the assets/footer.js pattern from ~/pers/karate/ — additive
   variant: appends a hits.sh badge to the existing <footer>. */

(function () {
  var footer = document.querySelector('footer');
  if (!footer) return;

  var counterURL =
    'https://hits.sh/rajeshgheware.github.io.svg' +
    '?style=flat-square&label=visits&color=b34a1e&labelColor=1a1a1a';

  var span = document.createElement('span');
  span.className = 'visit-counter';
  span.style.display = 'block';
  span.style.marginTop = '0.75rem';
  span.innerHTML =
    '<a href="https://github.com/rajeshgheware/rajeshgheware.github.io" ' +
    'target="_blank" rel="noopener" ' +
    'style="border:0;display:inline-block;" ' +
    'title="View source on GitHub">' +
    '<img src="' + counterURL + '" alt="visits" ' +
    'style="vertical-align:middle;height:20px;"></a>';
  footer.appendChild(span);
})();
