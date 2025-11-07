.PHONY: clean install install-dev

# Default Python
PYTHON := python3

clean: ## Remove Python cache files and virtual environment
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	rm -rf .venv/ 2>/dev/null || true
	@echo "✓ Cleaned cache files and virtual environment"

install: ## Install uv and production dependencies
	$(PYTHON) -m pip install uv
	uv venv
	uv sync --no-dev
	@echo "✓ Production dependencies installed"

install-dev: ## Install uv and all dependencies including dev
	$(PYTHON) -m pip install uv
	uv venv
	uv sync
	uv run pre-commit install
	@echo "✓ All dependencies installed (including dev)"
	@echo "✓ Pre-commit hooks installed"
