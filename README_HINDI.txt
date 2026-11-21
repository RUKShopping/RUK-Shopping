RUK SHOPPING — FREE STARTER KIT

यह एक तैयार PWA वेबसाइट का starter project है। कोई paid theme, paid plugin या paid hosting जरूरी नहीं है। हालांकि free hosting/database की limits और terms बदल सकती हैं; हमेशा के लिए मुफ्त रहने की गारंटी नहीं है।

क्या काम करता है:
- Public product catalog
- Search
- Affiliate / seller Buy Now link
- Admin login (Supabase Auth)
- Product add/edit/delete
- Website click tracking (एक product button click रिकॉर्ड)
- Admin द्वारा order/commission notes manually दर्ज करना
- PWA install support (Android Chrome में, hosting के बाद)

महत्वपूर्ण सीमाएँ:
1) Affiliate network के वास्तविक orders/commission अपने आप import नहीं होते। इसके लिए संबंधित network की official API/reporting permission और अलग integration चाहिए।
2) Clicks और orders अलग चीजें हैं। Click का मतलब sale नहीं है।
3) अभी कोई payment/cart/checkout नहीं है। खरीदारी seller की वेबसाइट पर होती है।
4) config.js में केवल Supabase की public anon/publishable key रखें। कभी भी service_role/secret key वेबसाइट में न डालें।
5) अपने नाम/उम्र के नियमों के अनुसार account और public deployment अभिभावक की मदद से करें।

FREE DEPLOYMENT STEPS (parent/guardian की मदद से):
A. Supabase database:
1. https://supabase.com पर guardian की मदद से free project बनाएं।
2. Project Settings > API में Project URL और anon/publishable key लें।
3. config.js में SUPABASE_URL और SUPABASE_ANON_KEY भरें।
4. Supabase SQL Editor में supabase_setup.sql की पूरी सामग्री चलाएं।
5. Authentication > Providers में Email चालू रखें। Signup confirmation enabled हो तो email verify करें।
6. वेबसाइट के Admin से account बनाएं। Email confirmation के बाद login करें।
7. Security: SQL policies owner-only product edits enforce करती हैं। Public visitors केवल active products देख सकते हैं।

B. Free hosting:
1. https://github.com पर guardian की मदद से repository बनाएं।
2. इस ZIP की सभी files repository के root में upload करें।
3. https://pages.cloudflare.com/ पर guardian account से GitHub repository connect करें।
4. Build command खाली रखें; output directory "/" या project root रखें (Cloudflare Pages Direct Upload/Git integration UI के अनुसार)।
5. Deploy करें। Cloudflare द्वारा दिया गया *.pages.dev address सार्वजनिक वेबसाइट होगा।
6. config.js में बदलाव के बाद redeploy करें।

C. Android install:
1. Published https://...pages.dev website टैब के Chrome में खोलें।
2. Chrome menu > Install app या Add to Home screen चुनें (उपलब्ध विकल्प डिवाइस पर निर्भर)।

पहला इस्तेमाल:
- Admin बटन > account create/login
- Product name, price, image URL, affiliate/seller URL, description भरें
- Save product
- Public page पर product दिखेगा
- Clicks admin dashboard में दिखेंगे
- Affiliate dashboard से order की पुष्टि होने के बाद ही order note manually दर्ज करें

Privacy:
- ग्राहक का नाम, फोन, पता, payment details, OTP या password इस साइट में न रखें।
- केवल वैध affiliate links और सही product descriptions डालें।
- Affiliate disclosure जोड़ें: "इस वेबसाइट के कुछ लिंक affiliate links हो सकते हैं। योग्य खरीदारी पर हमें कमीशन मिल सकता है; आपकी कीमत नहीं बढ़ती।"
- Affiliate program की उम्र, tax, disclosure और promotion policies पढ़ें।
