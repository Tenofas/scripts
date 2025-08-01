git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd ..
python -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128
python -m pip install -r requirements.txt
python -m pip install -r custom_nodes/comfyui-manager/requirements.txt
cd ..
echo "#!/bin/bash" > run_gpu.sh
echo "cd ComfyUI" >> run_gpu.sh
echo "source venv/bin/activate" >> run_gpu.sh
echo "python main.py --preview-method auto" >> run_gpu.sh
chmod +x run_gpu.sh

echo "#!/bin/bash" > run_cpu.sh
echo "cd ComfyUI" >> run_cpu.sh
echo "source venv/bin/activate" >> run_cpu.sh
echo "python main.py --preview-method auto --cpu" >> run_cpu.sh
chmod +x run_cpu.sh
