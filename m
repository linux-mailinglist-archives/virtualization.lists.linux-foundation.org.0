Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F48B3F2
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 11:18:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D1B1CB5;
	Tue, 13 Aug 2019 09:18:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 38779B3E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 806458A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 09:18:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id o4so670920wmh.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jW0tub2UzbL05NcO2bVMEMoWnqz9PpoPHHdwwy4/hhI=;
	b=UE0IUgA74ZgL+n93smNLdbItYW6n8ZFdfxKJ0fZhDxQPf1jsuOaSFmDwm3Yh36ZntI
	GNp0GNBu0L4/e+QCZp1fyd8tPqT8YeI5baxonEEqE2/8+471FZ1e2V0Y0a/sZgNEGCG0
	hh9AWpav7DeqS6N7WzpurM6AIZvgHIGi+ymlwPxXKWsPQexKd60qhOprZyTpSK45Y26m
	N4can23S+QqMX6KohoFDL4RiAKIuixJr/hYdmpD1AgYubDrrHrfMjfCKhmKoUNXCsxgR
	C1Jzgv36IQKOE4IySBQ/e+ehIK+HdDwsldpQkAr9linfPg29JHqLlV5hxUDtCREDIr31
	Upbg==
X-Gm-Message-State: APjAAAWSF+rq7+dum8FjTitUdOSFNMQGJY+cC/944K+HQm1Z6+1Xt5Rs
	/iJL/6jn5dYydfsBFAQrJBUFbbNqN2A=
X-Google-Smtp-Source: APXvYqy54+DaW4YK3FY/VYnqSfCxjCt45GhtNezxaN2179OBpbvne3bv8avk2VnkQaQfREwmbAyE2A==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr2086476wmf.14.1565687881016; 
	Tue, 13 Aug 2019 02:18:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d12:7fa9:fb2d:7edb?
	([2001:b07:6468:f312:5d12:7fa9:fb2d:7edb])
	by smtp.gmail.com with ESMTPSA id
	a19sm43628167wra.2.2019.08.13.02.17.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 02:18:00 -0700 (PDT)
Subject: Re: [RFC PATCH v6 79/92] kvm: x86: emulate movsd xmm, m64
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-80-alazar@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <32506209-7b16-4660-664b-4f6c73dc9433@redhat.com>
Date: Tue, 13 Aug 2019 11:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809160047.8319-80-alazar@bitdefender.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBGcm9tOiBNaWhhaSBE
b27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+Cj4gCj4gVGhpcyBpcyBuZWVkZWQgaW4gb3Jk
ZXIgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGd1ZXN0IGNvZGUgdGhhdCB1c2VzIG1vdnNkIHRvCj4g
d3JpdGUgaW50byBwYWdlcyB0aGF0IGFyZSBtYXJrZWQgZm9yIHdyaXRlIHRyYWNraW5nLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Cj4g
LS0tCj4gIGFyY2gveDg2L2t2bS9lbXVsYXRlLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYyBiL2FyY2gveDg2
L2t2bS9lbXVsYXRlLmMKPiBpbmRleCAzNDQzMWNmMzFmNzQuLjlkMzhmODkyYmVlYSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCj4gKysrIGIvYXJjaC94ODYva3ZtL2VtdWxh
dGUuYwo+IEBAIC0xMTc3LDYgKzExNzcsMjcgQEAgc3RhdGljIGludCBlbV9mbnN0c3coc3RydWN0
IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCj4gIAlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsKPiAg
fQo+ICAKPiArc3RhdGljIHU4IHNpbWRfcHJlZml4X3RvX2J5dGVzKGNvbnN0IHN0cnVjdCB4ODZf
ZW11bGF0ZV9jdHh0ICpjdHh0LAo+ICsJCQkgICAgICAgaW50IHNpbWRfcHJlZml4KQo+ICt7Cj4g
Kwl1OCBieXRlczsKPiArCj4gKwlzd2l0Y2ggKGN0eHQtPmIpIHsKPiArCWNhc2UgMHgxMToKPiAr
CQkvKiBtb3ZzZCB4bW0sIG02NCAqLwo+ICsJCS8qIG1vdnVwcyB4bW0sIG0xMjggKi8KPiArCQlp
ZiAoc2ltZF9wcmVmaXggPT0gMHhmMikgewo+ICsJCQlieXRlcyA9IDg7Cj4gKwkJCWJyZWFrOwo+
ICsJCX0KPiArCQkvKiBmYWxsdGhyb3VnaCAqLwo+ICsJZGVmYXVsdDoKPiArCQlieXRlcyA9IDE2
Owo+ICsJCWJyZWFrOwo+ICsJfQo+ICsJcmV0dXJuIGJ5dGVzOwo+ICt9Cj4gKwo+ICBzdGF0aWMg
dm9pZCBkZWNvZGVfcmVnaXN0ZXJfb3BlcmFuZChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4
dCwKPiAgCQkJCSAgICBzdHJ1Y3Qgb3BlcmFuZCAqb3ApCj4gIHsKPiBAQCAtMTE4Nyw3ICsxMjA4
LDcgQEAgc3RhdGljIHZvaWQgZGVjb2RlX3JlZ2lzdGVyX29wZXJhbmQoc3RydWN0IHg4Nl9lbXVs
YXRlX2N0eHQgKmN0eHQsCj4gIAo+ICAJaWYgKGN0eHQtPmQgJiBTc2UpIHsKPiAgCQlvcC0+dHlw
ZSA9IE9QX1hNTTsKPiAtCQlvcC0+Ynl0ZXMgPSAxNjsKPiArCQlvcC0+Ynl0ZXMgPSBjdHh0LT5v
cF9ieXRlczsKPiAgCQlvcC0+YWRkci54bW0gPSByZWc7Cj4gIAkJcmVhZF9zc2VfcmVnKGN0eHQs
ICZvcC0+dmVjX3ZhbCwgcmVnKTsKPiAgCQlyZXR1cm47Cj4gQEAgLTEyMzgsNyArMTI1OSw3IEBA
IHN0YXRpYyBpbnQgZGVjb2RlX21vZHJtKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LAo+
ICAJCQkJY3R4dC0+ZCAmIEJ5dGVPcCk7Cj4gIAkJaWYgKGN0eHQtPmQgJiBTc2UpIHsKPiAgCQkJ
b3AtPnR5cGUgPSBPUF9YTU07Cj4gLQkJCW9wLT5ieXRlcyA9IDE2Owo+ICsJCQlvcC0+Ynl0ZXMg
PSBjdHh0LT5vcF9ieXRlczsKPiAgCQkJb3AtPmFkZHIueG1tID0gY3R4dC0+bW9kcm1fcm07Cj4g
IAkJCXJlYWRfc3NlX3JlZyhjdHh0LCAmb3AtPnZlY192YWwsIGN0eHQtPm1vZHJtX3JtKTsKPiAg
CQkJcmV0dXJuIHJjOwo+IEBAIC00NTI5LDcgKzQ1NTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGdwcmVmaXggcGZ4XzBmXzJiID0gewo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBn
cHJlZml4IHBmeF8wZl8xMF8wZl8xMSA9IHsKPiAtCUkoVW5hbGlnbmVkLCBlbV9tb3YpLCBJKFVu
YWxpZ25lZCwgZW1fbW92KSwgTiwgTiwKPiArCUkoVW5hbGlnbmVkLCBlbV9tb3YpLCBJKFVuYWxp
Z25lZCwgZW1fbW92KSwgSShVbmFsaWduZWQsIGVtX21vdiksIE4sCj4gIH07Cj4gIAo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGdwcmVmaXggcGZ4XzBmXzI4XzBmXzI5ID0gewo+IEBAIC01MDk3LDcg
KzUxMTgsNyBAQCBpbnQgeDg2X2RlY29kZV9pbnNuKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpj
dHh0LCB2b2lkICppbnNuLCBpbnQgaW5zbl9sZW4pCj4gIHsKPiAgCWludCByYyA9IFg4NkVNVUxf
Q09OVElOVUU7Cj4gIAlpbnQgbW9kZSA9IGN0eHQtPm1vZGU7Cj4gLQlpbnQgZGVmX29wX2J5dGVz
LCBkZWZfYWRfYnl0ZXMsIGdvZmZzZXQsIHNpbWRfcHJlZml4Owo+ICsJaW50IGRlZl9vcF9ieXRl
cywgZGVmX2FkX2J5dGVzLCBnb2Zmc2V0LCBzaW1kX3ByZWZpeCA9IDA7Cj4gIAlib29sIG9wX3By
ZWZpeCA9IGZhbHNlOwo+ICAJYm9vbCBoYXNfc2VnX292ZXJyaWRlID0gZmFsc2U7Cj4gIAlzdHJ1
Y3Qgb3Bjb2RlIG9wY29kZTsKPiBAQCAtNTMyMCw3ICs1MzQxLDggQEAgaW50IHg4Nl9kZWNvZGVf
aW5zbihzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwgdm9pZCAqaW5zbiwgaW50IGluc25f
bGVuKQo+ICAJCQljdHh0LT5vcF9ieXRlcyA9IDQ7Cj4gIAo+ICAJCWlmIChjdHh0LT5kICYgU3Nl
KQo+IC0JCQljdHh0LT5vcF9ieXRlcyA9IDE2Owo+ICsJCQljdHh0LT5vcF9ieXRlcyA9IHNpbWRf
cHJlZml4X3RvX2J5dGVzKGN0eHQsCj4gKwkJCQkJCQkgICAgICBzaW1kX3ByZWZpeCk7Cj4gIAkJ
ZWxzZSBpZiAoY3R4dC0+ZCAmIE1teCkKPiAgCQkJY3R4dC0+b3BfYnl0ZXMgPSA4Owo+ICAJfQo+
IAoKUGxlYXNlIHN1Ym1pdCBhbGwgdGhlc2UgZW11bGF0b3IgcGF0Y2hlcyBhcyBhIHNlcGFyYXRl
IHNlcmllcywgY29tcGxldGUKd2l0aCB0ZXN0Y2FzZXMgZm9yIGt2bS11bml0LXRlc3RzLgoKUGFv
bG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
