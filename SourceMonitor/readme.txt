��SouceMonitor�g�p���@

1.����
  (1)gcov_exe.bat����"GCOVEXE"�����ɍ��킹�ď��������Ă��������B
     "GCOVEXE"�ɂ� gcov.exe �̃p�X���w�肵�܂��B
     gcov.exe�͒ʏ�AEclipse�C���X�g�[���t�H���_��"eclipse\mingw\bin\gcov.exe"��
     ����͂��ł��B
  (2)gcov_list.txt�����ɍ��킹�ď��������Ă��������B
     gcov_list.txt�ɂ�gcov�ɓ��͂���\�[�X�t�@�C���p�X���w�肵�܂��B
     ��jworkspace\XXXX\SRC\P_LOOP\�z����3�̃t�@�C�����w�肷��ꍇ
         �|gcov_list.txt�̓��e�|
         workspace\XXXX\SRC\P_LOOP\aaa
         workspace\XXXX\SRC\P_LOOP\bbb
         workspace\XXXX\SRC\P_LOOP\ccc
         (��)�g���q���܂܂Ȃ��悤�ɂ��Ă��������B
  (3)GCC�I�v�V����
     Eclipse��[�v���W�F�N�g][�v���p�e�B�[]��[C/C++ �r���h][�ݒ�][�c�[���ݒ�]�ƊJ���A
     [GCC C Compiler][���̑�][���̑��̃t���O]�ƁA
     [MinGW C Linker][���̑�][�����J�[�E�t���O]�Ɉȉ���ǉ����Ă��������B
     -fprofile-arcs -ftest-coverage
  (4)result�t�H���_
     result�t�H���_���̃t�@�C����gcov�o�͌��ʂł��B
     �V�Kproject�����\�z�����ۂɂ͂��̒��g��S�č폜���ĉ������B

2.���s
  gcov_exe_all.bat �����s���܂��B
  ���ʃt�@�C��"*.c.gcov"��result�t�H���_���ɏo�͂���܂��B

3.gcov_clear.bat�ɂ���
  gcov_clear.bat �����s�����gcov�̒��ԃt�@�C��(*.gcda)���폜���܂��B

  gcov�͎��s���鎎���Ώۂ�exe�������łł����*.gcda���X�V���邽�߁A�������J��Ԃ�
  �Ȃ���J�o���b�W��100%�ɋ߂Â���Ƃ������Ƃ��\�ƂȂ��Ă��܂��B�������\�[�X�t�@
  �C����ύX���čăr���h���Aexe�����s�����*.gcda�Ǝ��s���ʂ�����Ȃ��|�̃G���[��
  �\������܂��B���̏ꍇ*.gcda�t�@�C�����폜���A�J�o���b�W�̓��v�����Z�b�g����K�v
  ������܂��B
  �ʏ�AACU�̒P�̎����ł̓f�o�b�K�Œl������������悤�Ȏ蓮���̎����ł͂Ȃ��A����
  �S���[�g��ʂ��悤�Ȏ����h���C�o���L�q���Ă���͂��Ȃ̂ŁA�ăr���h�����ۂɂ͎���
  ��gcov_clear.bat�����s����悤�ɂ��Ă����΂悢���Ǝv���܂��B
  ���̕��@�́A
  Eclipse��[�v���W�F�N�g][�v���p�e�B�[]��[C/C++ �r���h][�ݒ�][�r���h�E�X�e�b�v]�ƊJ���A
  [�R�}���h]�Ɉȉ����L�q���܂��B
  "${workspace_loc:/${ProjName}/gcov/gcov_clear.bat}"

