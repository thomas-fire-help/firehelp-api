export const fetchConfig = () => {
  return {
    'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute('content'),
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
};
