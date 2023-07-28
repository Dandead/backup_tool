import dotenv
import os
import shutil
from datetime import datetime
import logging


logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO
)
logger = logging.getLogger(__name__)

dotenv.load_dotenv()

FILE_DATE_FORMAT = os.getenv("FILE_DATE_FORMAT")
BACKUP_FOLDER = os.getenv("BACKUP_FOLDER")

if not BACKUP_FOLDER or not FILE_DATE_FORMAT:
    raise ValueError(
        "BACKUP_FOLDER or FILE_DATE_FORMAT are not defined in .env"
    )

FILENAME = str(datetime.now().strftime(FILE_DATE_FORMAT))
EXTENSION = "zip"

if __name__ == "__main__":
    try:
        shutil.make_archive(
            FILENAME,
            EXTENSION,
            BACKUP_FOLDER
        )
        shutil.move(
            f"{FILENAME}.{EXTENSION}",
            "../"
        )
    except Exception:
        import traceback

        logger.warning(traceback.format_exc())
