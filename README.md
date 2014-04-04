تعريب برنامج الاستكمال التلقائي "Autocomplete by Uberi"
=====================
يقوم التطبيق باقتراح واستكمال الكلمات لدى كتابتها، ما يسمح بالكتابة بشكل أفضل وأسرع
# [احصل عليه الآن](https://github.com/linuxscout/Autocomplete)

![Screenshot](Screenshot.png)

طريقة الاستخدام
-----

1. قم بفك ضغط الملف المُحمّل
2. في حال ما إذا قُمت بتحميل التطبيق الجاهز، قم بفتح `Autocomplete.exe`
3. أما لو قمت بتحميل الشفرة المصدرية، فتحقق أولا بأنك تملك أحدث إصدار من تطبيق [AutoHotkey](http://www.autohotkey.com/) ومن ثم قم بتشغيل `Autocomplete.ahk`.
4. اشرع في الكتابة في أي مكان وستظهر لك علبة الاقتراحات بعد بضعة حروف.
5. استعن بزري التوجيه `فوق` و `تحت` لاختيار اقتراح آخر إذا كان الاقتراح الحالي غير مُناسب.
6. اضغط على زر `Enter` أو `Tab` لتأكيد الاختيار.

إعدادات مُتقدّمة
--------
انقر على زر التطبيق (بجانب ساعة النظام) لتظهر لك لوحة التحكم في إعدادات التطبيق التي تسمح لك بالتحكم مثلًا في عدد الاقتراحات التي تظهر في كل مرة أو في عدد الحروف الواجب كتابتها قبل ظهور الاقتراحات.

سيكون بإمكانك أيضا التحكم في قائمة الكلمات بالإضافة أو بالحذف. سيتم حفظ جميع الإعدادات لدى إغلاق التطبيق بشكل آلي.

يتم حفظ قائمة الكلمات في ملف `WordList.txt`، حيث يتم تخصيص سطر لكل كلمة. لن تحتاج سوى إلى مُحرر نصوص لتحرير هذا الملف، لكنك ستحتاج إلى مُحرر نصوص يتحمل فتح  الملفات الكبيرة لأنه من المُحتمل أن تنهار المُحررات التي لا تدعم ذلك.

أما الإعدادات فهي محفوظة في ملف `Settings.ini` الموجود داخل مُجلد التطبيق. يحتوي هذا الملف على إعدادات إضافية لا تظهر في لوحة التحكم آنفة الذكر  خاصة تلك التي تتعلق بإعدادات المفاتيح.

إعدادات المفاتيح عبارة عن قائمة عناوين مُرمّزة لأسماء المفاتيح، مثل  `Space` أو `d` ويتم الفصل ما بين كل مفتاحين بسطر جديد (العنوان المُرمّز للسطر الجديد هو  `%0A`). بإمكانك التعديل عليها وفق المفاتيح التي يقبلها التطبيق.

الترخيص
-------

This program is provided under the 3-clause BSD license. In short, this gives you the right to modify and distribute the program as you please, as long as you make sure the notice below is accessible to the user.

    Copyright (c) 2013, Anthony Zhang
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    
    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
