Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECE8D32D
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 14:33:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 94F2A101D;
	Wed, 14 Aug 2019 12:33:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9C1CC2C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:33:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6C338711
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:33:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so8662435wrr.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=upTbxgSaXX7vP3fRyuPdfadpq9YVtUPTVjwym3KEr4Y=;
	b=LGFyXOXLIXYxrBT5W2Tuc4o5CC5fypAE9DwAIOqL/jiCT5dtU2SCGIrtP3tpTLWTgg
	oSXxrMKfiPGwTJFy/wPtliEoNMQB5O/8VeV4aHmD23/QJI6vVs6QR2b+Ozby4ArhH5tG
	kicZalaSSkB8FWAeKWX5GPRDQa1sSIBGvak0aXP38YSFBqrRf4T/hbPGwrixdKm5nkCH
	2oeZ+skAZEtv4zI8xqRPKRhqsXEULmprK8zpkpsesMQ2aK/HVlNRrAXYOXhYK801v3SF
	qQo/FSQ3WMYhzknbtUfV6jsEQJGbVLJc2Ogueu83WbOc+iQeicZ4SH8VNQnGTkBCczhl
	bmuA==
X-Gm-Message-State: APjAAAXJOqn/SlFeyl+cFEuDiNJRroDsiglY/zRS9CPB6LYrkHRCdwnQ
	tvHo63bRAEMZH+kS2XKtJMcMVQ==
X-Google-Smtp-Source: APXvYqz1e95Qa1i40o6nza1DKDGFvEdbi2CRAHDnxQjpMJXDtInVEHY/zM9v7riSirWigzFbE4Rhgg==
X-Received: by 2002:adf:db49:: with SMTP id f9mr5035161wrj.112.1565785997898; 
	Wed, 14 Aug 2019 05:33:17 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	j10sm191268142wrd.26.2019.08.14.05.33.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Aug 2019 05:33:17 -0700 (PDT)
Subject: Re: [RFC PATCH v6 74/92] kvm: x86: do not unconditionally patch the
	hypercall instruction during emulation
To: =?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	kvm@vger.kernel.org
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-75-alazar@bitdefender.com>
	<1362cc5c-d0cd-6b7c-1151-9df3996fefa9@redhat.com>
	<5d53f965.1c69fb81.cd952.035bSMTPIN_ADDED_BROKEN@mx.google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <50bade53-c584-504d-7c02-1238af731666@redhat.com>
Date: Wed, 14 Aug 2019 14:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d53f965.1c69fb81.cd952.035bSMTPIN_ADDED_BROKEN@mx.google.com>
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
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

T24gMTQvMDgvMTkgMTQ6MDcsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPiBPbiBUdWUsIDEzIEF1
ZyAyMDE5IDExOjIwOjQ1ICswMjAwLCBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
PiB3cm90ZToKPj4gT24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSDciB3cm90ZToKPj4+
IEZyb206IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KPj4+Cj4+PiBJdCBj
YW4gaGFwcGVuZWQgZm9yIHVzIHRvIGVuZCB1cCBlbXVsYXRpbmcgdGhlIFZNQ0FMTCBpbnN0cnVj
dGlvbiBhcyBhCj4+PiByZXN1bHQgb2YgdGhlIGhhbmRsaW5nIG9mIGFuIEVQVCB3cml0ZSBmYXVs
dC4gSW4gdGhpcyBzaXR1YXRpb24sIHRoZQo+Pj4gZW11bGF0b3Igd2lsbCB0cnkgdG8gdW5jb25k
aXRpb25hbGx5IHBhdGNoIHRoZSBjb3JyZWN0IGh5cGVyY2FsbCBvcGNvZGUKPj4+IGJ5dGVzIHVz
aW5nIGVtdWxhdG9yX3dyaXRlX2VtdWxhdGVkKCkuIEhvd2V2ZXIsIHRoaXMgbGFzdCBjYWxsIHVz
ZXMgdGhlCj4+PiBmYXVsdCBHUEEgKGlmIGF2YWlsYWJsZSkgb3Igd2Fsa3MgdGhlIGd1ZXN0IHBh
Z2UgdGFibGVzIGF0IFJJUCwKPj4+IG90aGVyd2lzZS4gVGhlIHRyb3VibGUgYmVnaW5zIHdoZW4g
dXNpbmcgS1ZNSSwgd2hlbiB3ZSBmb3JiaWQgdGhlIHVzZSBvZgo+Pj4gdGhlIGZhdWx0IEdQQSBh
bmQgZmFsbGJhY2sgdG8gdGhlIGd1ZXN0IHB0IHdhbGs6IGluIFdpbmRvd3MgKDguMSBhbmQKPj4+
IG5ld2VyKSB0aGUgcGFnZSB0aGF0IHdlIHRyeSB0byB3cml0ZSBpbnRvIGlzIG1hcmtlZCByZWFk
LWV4ZWN1dGUgYW5kIGFzCj4+PiBzdWNoIGVtdWxhdG9yX3dyaXRlX2VtdWxhdGVkKCkgZmFpbHMg
YW5kIHdlIGluamVjdCBhIHdyaXRlICNQRiwgbGVhZGluZwo+Pj4gdG8gYSBndWVzdCBjcmFzaC4K
Pj4+Cj4+PiBUaGUgZml4IGlzIHJhdGhlciBzaW1wbGU6IGNoZWNrIHRoZSBleGlzdGluZyBpbnN0
cnVjdGlvbiBieXRlcyBiZWZvcmUKPj4+IGRvaW5nIHRoZSBwYXRjaGluZy4gVGhpcyBkb2VzIG5v
dCBjaGFuZ2UgdGhlIG5vcm1hbCBLVk0gYmVoYXZpb3VyLCBidXQKPj4+IGRvZXMgaGVscCB3aGVu
IHVzaW5nIEtWTUkgYXMgd2Ugbm8gbG9uZ2VyIGluamVjdCBhIHdyaXRlICNQRi4KPj4KPj4gRml4
aW5nIHRoZSBoeXBlcmNhbGwgaXMganVzdCBhbiBvcHRpbWl6YXRpb24uICBDYW4gd2UganVzdCBo
dXNoIGFuZAo+PiByZXR1cm4gdG8gdGhlIGd1ZXN0IGlmIGVtdWxhdG9yX3dyaXRlX2VtdWxhdGVk
IHJldHVybnMKPj4gWDg2RU1VTF9QUk9QQUdBVEVfRkFVTFQ/Cj4+Cj4+IFBhb2xvCj4gCj4gU29t
ZXRoaW5nIGxpa2UgdGhpcz8KPiAKPiAJZXJyID0gZW11bGF0b3Jfd3JpdGVfZW11bGF0ZWQoLi4u
KTsKPiAJaWYgKGVyciA9PSBYODZFTVVMX1BST1BBR0FURV9GQVVMVCkKPiAJCWVyciA9IFg4NkVN
VUxfQ09OVElOVUU7Cj4gCXJldHVybiBlcnI7CgpZZXMuICBUaGUgb25seSBkaWZmZXJlbmNlIHdp
bGwgYmUgdGhhdCB5b3UnbGwga2VlcCBnZXR0aW5nICNVRCB2bWV4aXRzCmluc3RlYWQgb2YgaHlw
ZXJjYWxsIHZtZXhpdHMuICBJdCdzIGFsc28gc2FmZXIsIHdlIHdhbnQgdG8gb2JleSB0aG9zZQpy
LXggcGVybWlzc2lvbnMgYmVjYXVzZSBQYXRjaEd1YXJkIHdvdWxkIGNyYXNoIHRoZSBzeXN0ZW0g
aWYgaXQgbm90aWNlZAp0aGUgcmV3cml0aW5nIGZvciB3aGF0ZXZlciByZWFzb24uCgpQYW9sbwoK
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMK
Pj4+IGluZGV4IDA0YjFkMjkxNmEwYS4uOTY1YzRmMDEwOGViIDEwMDY0NAo+Pj4gLS0tIGEvYXJj
aC94ODYva3ZtL3g4Ni5jCj4+PiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKPj4+IEBAIC03MzYz
LDE2ICs3MzYzLDMzIEBAIGludCBrdm1fZW11bGF0ZV9oeXBlcmNhbGwoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+Pj4gIH0KPj4+ICBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZW11bGF0ZV9oeXBlcmNh
bGwpOwo+Pj4gIAo+Pj4gKyNkZWZpbmUgS1ZNX0hZUEVSQ0FMTF9JTlNOX0xFTiAzCj4+PiArCj4+
PiAgc3RhdGljIGludCBlbXVsYXRvcl9maXhfaHlwZXJjYWxsKHN0cnVjdCB4ODZfZW11bGF0ZV9j
dHh0ICpjdHh0KQo+Pj4gIHsKPj4+ICsJaW50IGVycjsKPj4+ICAJc3RydWN0IGt2bV92Y3B1ICp2
Y3B1ID0gZW11bF90b192Y3B1KGN0eHQpOwo+Pj4gLQljaGFyIGluc3RydWN0aW9uWzNdOwo+Pj4g
KwljaGFyIGJ1ZltLVk1fSFlQRVJDQUxMX0lOU05fTEVOXTsKPj4+ICsJY2hhciBpbnN0cnVjdGlv
bltLVk1fSFlQRVJDQUxMX0lOU05fTEVOXTsKPj4+ICAJdW5zaWduZWQgbG9uZyByaXAgPSBrdm1f
cmlwX3JlYWQodmNwdSk7Cj4+PiAgCj4+PiArCWVyciA9IGVtdWxhdG9yX3JlYWRfZW11bGF0ZWQo
Y3R4dCwgcmlwLCBidWYsIHNpemVvZihidWYpLAo+Pj4gKwkJCQkgICAgICZjdHh0LT5leGNlcHRp
b24pOwo+Pj4gKwlpZiAoZXJyICE9IFg4NkVNVUxfQ09OVElOVUUpCj4+PiArCQlyZXR1cm4gZXJy
Owo+Pj4gKwo+Pj4gIAlrdm1feDg2X29wcy0+cGF0Y2hfaHlwZXJjYWxsKHZjcHUsIGluc3RydWN0
aW9uKTsKPj4+ICsJaWYgKCFtZW1jbXAoaW5zdHJ1Y3Rpb24sIGJ1Ziwgc2l6ZW9mKGluc3RydWN0
aW9uKSkpCj4+PiArCQkvKgo+Pj4gKwkJICogVGhlIGh5cGVyY2FsbCBpbnN0cnVjdGlvbiBpcyB0
aGUgY29ycmVjdCBvbmUuIFJldHJ5Cj4+PiArCQkgKiBpdHMgZXhlY3V0aW9uIG1heWJlIHdlIGdv
dCBoZXJlIGFzIGEgcmVzdWx0IG9mIGFuCj4+PiArCQkgKiBldmVudCBvdGhlciB0aGFuICNVRCB3
aGljaCBoYXMgYmVlbiByZXNvbHZlZCBpbiB0aGUKPj4+ICsJCSAqIG1lYW4gdGltZS4KPj4+ICsJ
CSAqLwo+Pj4gKwkJcmV0dXJuIFg4NkVNVUxfQ09OVElOVUU7Cj4+PiAgCj4+PiAtCXJldHVybiBl
bXVsYXRvcl93cml0ZV9lbXVsYXRlZChjdHh0LCByaXAsIGluc3RydWN0aW9uLCAzLAo+Pj4gLQkJ
JmN0eHQtPmV4Y2VwdGlvbik7Cj4+PiArCXJldHVybiBlbXVsYXRvcl93cml0ZV9lbXVsYXRlZChj
dHh0LCByaXAsIGluc3RydWN0aW9uLAo+Pj4gKwkJCQkgICAgICAgc2l6ZW9mKGluc3RydWN0aW9u
KSwgJmN0eHQtPmV4Y2VwdGlvbik7Cj4+PiAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
