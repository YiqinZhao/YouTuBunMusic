from PIL import Image

img = Image.open('./icon.png')

sizes = [16, 32, 128, 256, 512]
scales = [1, 2]

for sz in sizes:
    for sc in scales:
        img_resized = img.resize((sz * sc, sz * sc), Image.ANTIALIAS)
        img_resized.save(f'./dist/icon-{sz}x{sz}@{sc}x.png')
