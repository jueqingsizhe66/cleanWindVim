try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
PLUGINS = """
vimwiki https://github.com/vimwiki/vimwiki
vim-textobj-user https://github.com/kana/vim-textobj-user
vim-textobj-uri https://github.com/jceb/vim-textobj-uri
vim-textobj-line https://github.com/kana/vim-textobj-line
vim-textobj-fold https://github.com/kana/vim-textobj-fold
vim-startify https://github.com/mhinz/vim-startify
vim-speeddating https://github.com/tpope/vim-speeddating
vim-sneak https://github.com/justinmk/vim-sneak
vim-signature https://github.com/kshenoy/vim-signature
vim-copy-filename https://github.com/AdamWhittingham/vim-copy-filename
vim-asterisk https://github.com/haya14busa/vim-asterisk
limelight.vim https://github.com/junegunn/limelight.vim
vim-easymotion https://github.com/easymotion/vim-easymotion
incsearch-fuzzy.vim https://github.com/haya14busa/incsearch-fuzzy.vim
incsearch-easymotion.vim https://github.com/haya14busa/incsearch-easymotion.vim
incsearch.vim https://github.com/haya14busa/incsearch.vim
ctrlp-funky https://github.com/tacahiroy/ctrlp-funky
vim-togglemouse https://github.com/nvie/vim-togglemouse
paredit.vim https://github.com/vim-scripts/paredit.vim
rainbow_parentheses.vim https://github.com/kien/rainbow_parentheses.vim
supertab https://github.com/ervandew/supertab
vimfiler.vim https://github.com/Shougo/vimfiler.vim
unite.vim https://github.com/Shougo/unite.vim
unite-outline https://github.com/h1mesuke/unite-outline
txt.vim https://github.com/vim-scripts/txt.vim
vim-fat-finger https://github.com/chip/vim-fat-finger
vim-cursorword https://github.com/itchyny/vim-cursorword
gv.vim https://github.com/junegunn/gv.vim
delimitmate https://github.com/Raimondi/delimitMate
clever-f.vim https://github.com/rhysd/clever-f.vim
csv.vim https://github.com/chrisbra/csv.vim
calendar-vim https://github.com/mattn/calendar-vim
vim-plugins https://github.com/WolfgangMehner/vim-plugins
vim-perl https://github.com/vim-perl/vim-perl
tagbar https://github.com/majutsushi/tagbar
vim-easytags https://github.com/xolox/vim-easytags
vim-misc https://github.com/xolox/vim-misc
vim-sensible https://github.com/tpope/vim-sensible
nerdcommenter https://github.com/scrooloose/nerdcommenter
ag.vim https://github.com/vim-scripts/ag.vim
python-mode https://github.com/python-mode/python-mode
""".strip()


#fzf.vim https://github.com/junegunn/fzf.vim
# vim-mark https://github.com/dimasg/vim-mark
GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'my_plugins')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print('Updated {0}'.format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(' ')
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path,
                             temp_directory, SOURCE_DIR)


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
